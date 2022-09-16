FactoryBot.define do
  factory :pokemon do
    name { Faker::Games::Pokemon.name }
    base_experience { Faker::Number.between(from: 10, to: 1000) }
    sprite_url { Faker::Avatar.image }
    user
  end
end
