class Gossip < ApplicationRecord
  belongs_to :user
  has_many :JoinTableTagGossips
  has_many :tags, through: :JoinTableTagGossips
  
  validates :title, length: { in: 3..12, message: "error too short(<3) or too long(>12)"}
  validates :content, presence: true, presence: { message: "empty content" }
end
