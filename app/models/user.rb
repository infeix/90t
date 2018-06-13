# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable

  has_many :reminders, dependent: :destroy

  before_validation :lock_user

  validates :name, presence: true

  def lock_user
    self.locked_at = Time.zone.now
  end

  def unlock_user
    self.locked_at = nil
  end

  def unlock_user!
    self.locked_at = nil
    save!
  end
end
