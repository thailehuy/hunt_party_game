FactoryGirl.define do
  factory :character_class do
    sequence(:name) { |n| "Char Class #{n}" }
    sequence(:description) { |n| "Char Class #{n} description" }
  end
end