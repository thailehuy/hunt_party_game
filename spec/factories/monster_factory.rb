FactoryGirl.define do
  factory :monster do
    monster_class
    location
    sequence(:name) { |n| "Monster #{n}" }

    trait :boss do
      is_boss { true }
    end
  end
end