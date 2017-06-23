require "rails_helper"

RSpec.describe Party do
  let(:party) { FactoryGirl.create(:party) }

  describe '.gather_characters!' do
    it 'gathers 1 character for each character class' do
      party.gather_characters!
      CharacterClass.all.each do |char_class|
        party_char = party.characters.detect{|char| char.character_class == char_class}
        expect(party_char).not_to be_nil
      end
    end

    describe 'with attributes and traits' do
      let(:stub_char) { double() }
      let(:stub_chars) { double() }
      before(:each) do
        char_count = CharacterClass.count
        expect(party).to receive(:characters).exactly(char_count).times.and_return(stub_chars)
        expect(stub_chars).to receive(:create).exactly(char_count).times.and_return(stub_char)
        expect(stub_char).to receive(:add_attributes!).exactly(char_count).times
        expect(stub_char).to receive(:add_traits!).exactly(char_count).times
      end
      it 'added for each character' do
        party.gather_characters!
      end
    end
  end

  describe '.wiped?' do
    before(:each) do
      party.gather_characters!
      party.characters.map(&:calculate_stats)
    end

    describe 'when party is wiped' do
      before(:each) do
        party.characters.each {|char| char.stats.dead = true}
      end
      it 'returns true' do
        expect(party.wiped?).to be_truthy
      end
    end

    describe 'when party is not wiped' do
      before(:each) do
        party.characters.each {|char| char.stats.dead = false}
      end
      it 'returns false' do
        expect(party.wiped?).not_to be_truthy
      end
    end
  end
end