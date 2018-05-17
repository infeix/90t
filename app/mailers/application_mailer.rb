# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  FROM_ADDRESS = ENV['NEUNZIGT_MAIL']
  default from: FROM_ADDRESS
  layout 'mailer'
end
