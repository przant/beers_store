# frozen_string_literal: true

class
   User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { in: 3..15 }
  validates :surname, presence: true, length: { in: 3..25 }
end
