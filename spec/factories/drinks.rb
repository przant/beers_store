FactoryBot.define do
  factory :drink do
    name { "MyString" }
    description { "MyText" }
    ingredients { "MyText" }
    price { 1.5 }
  end
end
