# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  FROM_ADDRESS = ENV['NEUNZIGT_MAIL'] || 'mail@johanneskroop.de'
  default from: FROM_ADDRESS
  layout 'mailer'
end
