FactoryGirl.define do
  factory :player do
    transient do
      confirmed false
    end

    email
    password { '123456' }
    password_confirmation { '123456' }

    after(:create) do |player, evaluator|
      player.confirm if evaluator.confirmed
    end
  end
end