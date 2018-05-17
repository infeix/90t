# frozen_string_literal: true

require 'factory_bot'

def debug(message)
  puts message unless Rails.env.test?
end

user_password = 'secret42'
admin_attributes = {
  name: 'admin',
  email: ENV['NEUNZIGT_MAIL'],
  password: user_password,
  password_confirmation: user_password
}

admin = User.find_by(email: ENV['NEUNZIGT_MAIL'])
if admin
  admin.update admin_attributes
else
  FactoryBot.create :user, admin_attributes
end
