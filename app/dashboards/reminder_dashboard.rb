require "administrate/base_dashboard"

class ReminderDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    id: Field::Number,
    name: Field::String,
    refresh_rate: Field::Number,
    refresh_rate_unit: Field::String,
    refreshed_at: Field::DateTime,
    required_at: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :id,
    :name,
    :refresh_rate,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :id,
    :name,
    :refresh_rate,
    :refresh_rate_unit,
    :refreshed_at,
    :required_at,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :name,
    :refresh_rate,
    :refresh_rate_unit,
    :refreshed_at,
    :required_at,
  ].freeze

  # Overwrite this method to customize how reminders are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(reminder)
  #   "Reminder ##{reminder.id}"
  # end
end
