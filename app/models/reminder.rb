# frozen_string_literal: true

class Reminder < ApplicationRecord
  UNITS = %w[Tage Monat(e) Jahr(e)].freeze

  before_validation :set_required_at

  belongs_to :user

  scope(:only_from_user, ->(user) { where('user_id = :user', user: user.id) })
  scope(:old_refreshed_frist, -> { order(:refreshed_at) })

  def required_in_days
    days = ((required_at - Time.zone.now) / 1.day).ceil
    if days.negative?
      0
    else
      days
    end
  end

  def set_required_at
    unit_time = if refresh_rate_unit == 'Months'
      1.month
    elsif refresh_rate_unit == 'Years'
      1.year
    else
      1.day
    end

    refreshrate_time = refresh_rate * unit_time
    self.required_at = refreshed_at + refreshrate_time
  end
end
