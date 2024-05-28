FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "name#{n}" }
    age { 20 }
  end
end
