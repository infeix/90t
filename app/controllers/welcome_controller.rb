# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    @resource = User.new
    @resource_name = :user
    @controller_name = 'sessions'
    redirect_to reminders_path if current_user.present?
  end

  def imprint; end

  def privacy_policy; end
end
