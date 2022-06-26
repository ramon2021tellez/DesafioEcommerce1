class Order < ApplicationRecord
before_create :generate_number
  belongs_to :user

  def generate_number
    self.number ||= loop do
      random = "BO#{Array.new(9) { rand(9) }.join}"
      break random unless self.class.exists?(number: random)
    end
  end