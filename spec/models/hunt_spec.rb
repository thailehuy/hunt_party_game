require "rails_helper"

RSpec.describe Hunt do
  let(:party) { FactoryGirl.create(:party, :with_members) }
  let(:hunt) { FactoryGirl.build(:hunt, monster: nil, party: party) }
  let!(:monster) { FactoryGirl.create(:monster, location: party.location) }
  let!(:boss) { FactoryGirl.create(:monster, :boss, location: party.location) }

  describe '.process!' do
    it 'calls .save!' do
      expect(hunt).to receive(:assign_target).and_return(nil)
      expect(hunt).to receive(:save!).and_return(true)
      expect(hunt.process!).to be_truthy
    end

    it 'calls .assign_target' do
      expect(hunt).to receive(:assign_target).and_return(nil)
      expect{hunt.process!}.to raise_error(ActiveRecord::RecordInvalid) # no monster validation
    end

    describe 'when monster not present' do
      it 'does not call .simulate_battle' do
        hunt.monster = nil
        expect(hunt).to receive(:assign_target).and_return(nil)
        expect(hunt).not_to receive(:simulate_battle)
        expect{hunt.process!}.to raise_error(ActiveRecord::RecordInvalid) # no monster validation
      end
    end

    describe 'when monster present' do
      it 'calls .simulate_battle' do
        hunt.monster = monster
        expect(hunt).to receive(:simulate_battle)
        hunt.process!
      end
    end
  end

  describe '.assign_target' do
    describe 'when monster is mob' do
      it 'assigns a mob monster' do
        hunt.hunt_type = 'mob'
        expect(hunt).to receive(:find_monster_target!).and_return(monster)
        hunt.assign_target
      end
    end
    describe 'when monster is boss' do
      it 'calls find_boss_target!' do
        hunt.hunt_type = 'boss'
        expect(hunt).to receive(:find_boss_target!).and_return(boss)
        hunt.assign_target
      end
    end
    describe 'when monster is undefined' do
      it 'adds to errors' do
        hunt.hunt_type = 'undefined'
        expect(hunt).not_to receive(:find_boss_target!)
        expect(hunt).not_to receive(:find_monster_target!)
        hunt.assign_target
        expect(hunt.errors.to_a.count).to eq(1)
        expect(hunt.errors.to_a.first).to eq('Invalid hunt')
      end
    end
  end

  describe '.find_monster_target!' do
    it 'assigns a mob target to hunt' do
      hunt.find_monster_target!
      expect(hunt.monster).to eq(monster)
    end
  end

  describe '.find_boss_target!' do
    it 'assigns a mob target to hunt' do
      hunt.find_boss_target!
      expect(hunt.monster).to eq(boss)
    end
  end

  describe '.boss_battle?' do
    describe 'when monster is a boss' do
      it 'returns true' do
        hunt.monster = boss
        expect(hunt.boss_battle?).to be_truthy
      end
    end
    describe 'when monster is not a boss' do
      it 'returns true' do
        hunt.monster = monster
        expect(hunt.boss_battle?).not_to be_truthy
      end
    end
  end

  describe '.max_rounds' do
    describe 'when monster is a boss' do
      it 'returns 10' do
        hunt.monster = boss
        expect(hunt.max_rounds).to eq(10)
      end
    end
    describe 'when monster is not a boss' do
      it 'returns 5' do
        hunt.monster = monster
        expect(hunt.max_rounds).to eq(5)
      end
    end
  end

  describe '.simulate_battle' do
    before(:each) do
      hunt.monster = boss
    end
    it 'calculates monster stats' do
      expect(hunt.monster).to receive(:calculate_stats)
      hunt.simulate_battle
    end

    it 'calculates each party member stats' do
      hunt.party.characters.each do |character|
        expect(character).to receive(:calculate_stats)
      end

      hunt.simulate_battle
    end

    describe 'when monster does not die' do
      before(:each) do
        boss.stats.health = 10000
        boss.stats.power = 0
        hunt.simulate_battle
      end
      it 'lasts till max rounds' do
        expect(hunt.battle_rounds.to_a.count).to eq(hunt.max_rounds)
      end

      it 'sets hunt to not concluded' do
        expect(hunt.victorious).not_to be_truthy
        expect(hunt.defeated).not_to be_truthy
      end
    end

    describe 'when monster does die' do
      before(:each) do
        boss.stats.health = 1
        boss.stats.power = 0
        boss.stats.dodge = 0
        boss.stats.block = 0
        hunt.simulate_battle
      end
      it 'lasts less than max rounds' do
        expect(hunt.battle_rounds.to_a.count).to eq(1)
      end

      it 'sets hunt to victorious' do
        expect(hunt.victorious).to be_truthy
      end
    end

    describe 'when party is wiped' do
      before(:each) do
        boss.stats.health = 100000
        boss.stats.power = 100
        boss.stats.dodge = 100
        boss.stats.block = 100
        hunt.simulate_battle
      end
      it 'sets hunt to defeated' do
        expect(hunt.defeated).to be_truthy
      end
    end
  end
end