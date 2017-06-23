FactoryGirl.define do
  factory :party do
    player
    location
    hunt_energy { 20 }
    bounty_energy { 0 }
    experience { 0 }
    level { 1 }
  end
end