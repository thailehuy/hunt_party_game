FactoryGirl.define do
  factory :attribute_type do
    sequence(:name) { |n| "Attribute Type Name #{n}" }
    sequence(:description) { |n| "Attribute Type Description #{n}" }
    base_value { 0 }
  end
end