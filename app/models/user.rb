class User < ApplicationRecord
  belongs_to :city

  has_many :LierPrivateMessageUsers
  has_many :received_messages,through: :LierPrivateMessageUsers, source: :private_message
  has_many :sent_messages, foreign_key: 'sender_id',class_name: "PrivateMessage"
  
  validates :first_name, presence: true
  validates :last_name, presence: true, uniqueness: true
  validates :description, presence: true, length: { maximum: 200 }
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
  validates :age, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 120 }
  has_secure_password
end
