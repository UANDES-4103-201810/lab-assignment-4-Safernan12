class User < ApplicationRecord
  has_many :user_ticket
  has_many :ticket, :through => :user_ticket

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
  validates :phone, length: { in: 9..12 }
  validates :phone, numericality: { only_integer: true}
  validates :password, length: { in: 8..12 }
  validates :password, format: { with: /\A[A-Za-z0-9]\z/}

end
