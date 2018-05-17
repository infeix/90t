# frozen_string_literal: true

class Reminder < ApplicationRecord
  UNITS = %w[Days Months Years]

  before_validation :set_required_at

  belongs_to :user

  scope(:only_from_user, ->(user) { where('user_id = :user', user: user.id) })

  def required_in_days
    ((required_at - Time.zone.now) / 1.day).ceil
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
