# frozen_string_literal: true

FactoryBot.define do
  factory :snack do
    sequence(:name) { |n| "SampleSnack##{n}" }
    sequence(:description) { |n| "Sample description for the Snack ##{n}" }
    sequence(:ingredients) { |n| "Sample list of ingredients for the Snack##{n}" }
    price { 7 }
  end
end
