class AddWeekToHabits < ActiveRecord::Migration[7.1]
  def change
    add_reference :habits, :week, null: false, foreign_key: true
  end
end
