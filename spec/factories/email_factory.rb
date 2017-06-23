# Defines a new sequence
FactoryGirl.define do
  sequence :email do |n|
    "player#{n}@test.com"
  end
end
