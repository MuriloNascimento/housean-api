# app/models/item.rb
class Item < ApplicationRecord

  # model association
  belongs_to :category

  # validation
  validates :category, presence: true
  validates :name, presence: true, length: { minimum: 0, maximum: 255 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :minimum_amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :amount, numericality: { greater_than_or_equal_to: 0 }

  # scope
  scope :purchase, -> { where('amount < minimum_amount') }

  def amount_purchase
    minimum_amount - amount
  end

end
