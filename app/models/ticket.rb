class Ticket < ApplicationRecord
  belongs_to :event
  has_many :user_ticket
  has_many :user, through: :user_ticket
  validates :price, numericality: { :greater_than => 0}


end
