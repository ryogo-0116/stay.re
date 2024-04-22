# app/models/reservation.rb
class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validate :check_in_date_cannot_be_in_the_past
  validate :check_out_date_after_check_in_date
  validates :num_of_guests, presence: true, numericality: { greater_than: 0 }

  def total_price
    total_days = (check_out_date - check_in_date).to_i
    room.price * total_days * num_of_guests
  end

  private

  def check_in_date_cannot_be_in_the_past
    errors.add(:check_in_date, "can't be in the past") if check_in_date.present? && check_in_date < Date.today
  end

  def check_out_date_after_check_in_date
    return unless check_in_date.present? && check_out_date.present?

    if check_out_date <= check_in_date
      errors.add(:check_out_date, "must be after the check-in date")
    end
  end
end

