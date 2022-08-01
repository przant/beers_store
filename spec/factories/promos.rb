FactoryBot.define do
  factory :promo do
    name { "MyString" }
    description { "MyText" }
    active { false }
    price { 1.5 }
  end
end
