FactoryGirl.define do
  factory :hunt do
    party
    monster
    victorious { false }
    defeated { false }
  end
end