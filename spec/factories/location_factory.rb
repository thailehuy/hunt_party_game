FactoryGirl.define do
  factory :location do
    sequence(:name) { |n| "Location #{n}" }
    description { 'Location description' }
  end
end