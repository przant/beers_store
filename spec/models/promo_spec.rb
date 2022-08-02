# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Promo, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_numericality_of(:price) }
    it {
      should validate_length_of(:description)
        .is_at_least(30)
        .is_at_most(180)
        .on(:create)
    }
  end
end
