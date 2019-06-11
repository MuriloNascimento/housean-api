# app/models/category.rb
class Category < ApplicationRecord

  # model association
  has_many :items, dependent: :destroy

  # validations
  validates :name, presence: true, length: { minimum: 0, maximum: 255 }

end
