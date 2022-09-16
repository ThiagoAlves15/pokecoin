FactoryBot.define do
  factory :rate do
    rate { Faker::Number.within(range: 0.000001..0.01) }
  end
end
