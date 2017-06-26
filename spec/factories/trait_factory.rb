FactoryGirl.define do
  factory :trait do
    attribute_type
    character_class
    sequence(:name) { |n| "Trait #{n}" }
    sequence(:description) { |n| "Trait #{n} Description" }
    value { 0 }

    trait :exclusive do
      exclusive { true }
    end
    trait :non_exclusive do
      exclusive { false }
    end
  end
end