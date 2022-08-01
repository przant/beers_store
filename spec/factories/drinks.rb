# frozen_string_literal: true

FactoryBot.define do
  factory :drink do
    sequence(:name) { |n| "SampleDrink##{n}" }
    sequence(:description) { |n| "Sample description for the Drink ##{n}" }
    sequence(:ingredients) { |n| "Sample list of ingredients for the Drink##{n}" }
    price { 20 }
  end
end
