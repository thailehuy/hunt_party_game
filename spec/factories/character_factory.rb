FactoryGirl.define do
  factory :character do
    character_class
    party
    sequence(:name) { |n| "Char Name #{n}" }
  end
end