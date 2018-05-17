class CreateReminders < ActiveRecord::Migration[5.1]
  def change
    create_table :reminders do |t|
      t.string :name
      t.integer :refresh_rate
      t.string :refresh_rate_unit
      t.datetime :refreshed_at
      t.datetime :required_at

      t.timestamps
    end
  end
end
