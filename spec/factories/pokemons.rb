FactoryBot.define do
  factory :pokemon do
    name { "MyString" }
    base_experience { 1 }
    sprite_url { "MyString" }
    user { nil }
  end
end
