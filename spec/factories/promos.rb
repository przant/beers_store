# frozen_string_literal: true

FactoryBot.define do
  factory :promo do
    sequence(:name) { |n| "SampleSnack##{n}" }
    sequence(:description) { |n| "Sample description for the Snack ##{n}" }
    active { false }
    price { 1.5 }
  end

  trait :active_promo do
    active { true }
  end
end
