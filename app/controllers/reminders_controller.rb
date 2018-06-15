# frozen_string_literal: true

class RemindersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reminder, only: %i[show edit update destroy refresh]

  # GET /reminders
  def index
    @reminders = Reminder.all.only_from_user(current_user)
  end

  # GET /reminders/1
  def show; end

  # GET /reminders/new
  def new
    @reminder = Reminder.new
    @reminder.user = current_user
    @reminder.refresh_rate = 90
  end

  # GET /reminders/1/edit
  def edit; end

  # POST /reminders/1/refresh
  def refresh
    @reminder.refreshed_at = Time.zone.now.beginning_of_day
    if @reminder.save
      redirect_to reminders_url, notice: 'Reminder was successfully refreshed.'
    else
      redirect_to reminders_url, notice: 'Reminder was successfully refreshed.'
    end
  end

  # POST /reminders
  def create
    @reminder = Reminder.new(reminder_params)
    @reminder.user = current_user

    if @reminder.save
      redirect_to @reminder, notice: 'Reminder was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /reminders/1
  def update
    if @reminder.update(reminder_params)
      redirect_to @reminder, notice: 'Reminder was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /reminders/1
  def destroy
    @reminder.destroy
    redirect_to reminders_url, notice: 'Reminder was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reminder
    @reminder = Reminder.only_from_user(current_user).find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def reminder_params
    params.require(:reminder).permit(:name, :refresh_rate, :refresh_rate_unit, :refreshed_at)
  end
end
