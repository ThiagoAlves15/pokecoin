FactoryBot.define do
  factory :sale do
    association :from_user_id, factory: :user
    association :to_user_id, factory: :user
    pokemon
  end
end
