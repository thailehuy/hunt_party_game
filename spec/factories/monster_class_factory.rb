FactoryGirl.define do
  factory :monster_class do
    sequence(:name) { |n| "Monster #{n}" }
    sequence(:description) { |n| "Monster #{n} Description" }
  end
end