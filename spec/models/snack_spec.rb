# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Snack, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:ingredients) }
    it { should validate_numericality_of(:price) }
    it {
      should validate_length_of(:description)
        .is_at_least(30)
        .is_at_most(180)
        .on(:create)
    }
    it {
      should validate_length_of(:ingredients)
        .is_at_least(3)
        .is_at_most(180)
        .on(:create)
    }
  end
end
