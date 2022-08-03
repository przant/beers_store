# frozen_string_literal: true

FactoryBot.define do
  factory :promo do
    sequence(:name) { |n| "SamplePromo##{n}" }
    sequence(:description) { |n| "Sample description for the Promo ##{n}" }
    active { false }
    price { 50 }
  end

  trait :active_promo do
    active { true }
  end
end
