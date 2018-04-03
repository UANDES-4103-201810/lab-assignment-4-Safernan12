class UserTicket < ApplicationRecord
  belongs_to :user
  belongs_to :ticket

  validate :date_is_valid
  before_create :check_availability,
                :check_buyers

  def date_is_valid
    if self.ticket.event.start_date < self.time
      self.errors.add(:time, 'not a valid time')
    end
  end

  def check_availability
    if self.ticket.event.start_date < self.time
      self.errors.add(:time, 'can not make ticket')
    end
  end

  def check_buyers
    if user_ticket.where(paid: false).exists?
      self.error.add(:paid, 'Someone did not pay for his ticket')
    end
  end



end
