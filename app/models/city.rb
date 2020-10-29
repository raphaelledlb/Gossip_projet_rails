class City < ApplicationRecord
  has_many :users
  
  validates :name, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :zip_code, presence: true
end
