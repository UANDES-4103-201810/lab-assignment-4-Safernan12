class Event < ApplicationRecord
  belongs_to :place
  has_many :ticket
  validates :start_date, uniqueness: true
  validate :ensure_date_is_valid

  def ensure_date_is_valid
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end

end
