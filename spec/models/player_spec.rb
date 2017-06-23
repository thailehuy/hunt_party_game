require "rails_helper"

RSpec.describe Player do
  let(:player) { FactoryGirl.build(:player) }

  describe 'on creation' do
    describe '.gather_party' do
      let(:party) { double() }

      it 'creates player party' do
        player.save
        expect(player.party).not_to be_nil
      end

      it 'gathers party characters' do
        expect(player).to receive(:create_party).with(hunt_energy: 20, bounty_energy: 0, experience: 0, level: 1, location: Location.beginner).and_return(party)
        expect(party).to receive(:gather_characters!).and_return(true)
        player.save
      end
    end
  end
end