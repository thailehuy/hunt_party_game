require "rails_helper"

RSpec.describe Character do
  describe 'class method' do
    describe '#name_generator' do
      it 'is a name generator instance' do
        expect(Character.name_generator).to be_a(Namey::Generator)
      end
    end

    describe '#random_name' do
      let(:name_result) { 'generated' }
      it 'calls name generator generate function' do
        expect(Character.name_generator).to receive(:generate).with(with_surname: false, min_freq: 85, max_freq: 100).and_return(name_result)
        expect(Character.random_name).to eq(name_result)
      end
    end
  end

  describe 'instance method' do
    let(:character) { FactoryGirl.build(:character, character_class: CharacterClass.first) }
    let!(:exclusive_trait) { FactoryGirl.create(:trait, :exclusive, character_class: character.character_class) }
    let!(:exclusive_trait2) { FactoryGirl.create(:trait, :exclusive, character_class: character.character_class) }
    let!(:non_exclusive_trait) { FactoryGirl.create(:trait, :non_exclusive, character_class: character.character_class) }
    let!(:non_exclusive_trait2) { FactoryGirl.create(:trait, :non_exclusive, character_class: character.character_class) }

    describe '.add_attributes!' do
      before(:each) do
        character.add_attributes!
      end
      it 'adds all the exclusive traits' do
        # use .to_a because .count calls a SQL function and the objects are not saved to DB yet
        expect(character.traits.to_a.count).to eq(2)
        expect(character.traits).to include(exclusive_trait)
        expect(character.traits).to include(exclusive_trait2)
      end

      it 'does not add non_exclusive traits' do
        expect(character.traits).not_to include(non_exclusive_trait)
        expect(character.traits).not_to include(non_exclusive_trait2)
      end
    end

    describe '.add_traits!' do
      let!(:non_exclusive_trait3) { FactoryGirl.create(:trait, :non_exclusive, character_class: character.character_class) }
      before(:each) do
        character.add_traits!
      end
      it 'adds exactly 2 non-exclusive traits' do
        # use .to_a because .count calls a SQL function and the objects are not saved to DB yet
        expect(character.traits.to_a.count).to eq(2)
        expect(character.traits.first.exclusive).not_to be_truthy
        expect(character.traits.last.exclusive).not_to be_truthy
      end

      it 'does not add exclusive traits' do
        expect(character.traits).not_to include(exclusive_trait)
        expect(character.traits).not_to include(exclusive_trait2)
      end
    end

    describe '.base_stats' do
      it 'returns on open struct for stats' do
        expect(character.base_stats).to eq(OpenStruct.new(
                                               health: 0,
                                               power: 0,
                                               defense: 0,
                                               dodge: 0,
                                               pierce: 0,
                                               taunt: 0,
                                               recovery: 0,
                                               power_charge: 0,
                                               dead: false
                                           ))
      end
    end

    describe '.calculate_stats' do
      let!(:exclusive_attack_trait) { FactoryGirl.create(:trait, :exclusive, character_class: character.character_class, attribute_type: AttributeType.power_type, value: 1) }
      let!(:exclusive_defense_trait) { FactoryGirl.create(:trait, :exclusive, character_class: character.character_class, attribute_type: AttributeType.defense_type, value: 1) }
      before(:each) do
        character.save! # need to save because the include in code need persisted objects
        character.add_traits!
        character.add_attributes!
        character.calculate_stats
      end

      it 'sums all attributes into stats struct' do
        expect(character.stats).to eq(OpenStruct.new(
                                               health: 0,
                                               power: 1,
                                               defense: 1,
                                               dodge: 0,
                                               pierce: 0,
                                               taunt: 0,
                                               recovery: 0,
                                               power_charge: 0,
                                               dead: false
                                           ))
      end

    end
  end


end