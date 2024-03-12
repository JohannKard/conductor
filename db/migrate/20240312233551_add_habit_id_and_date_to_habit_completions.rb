class AddHabitIdAndDateToHabitCompletions < ActiveRecord::Migration[7.1]
  def change
    add_column :habit_completions, :habit_id, :integer, null: false
    add_column :habit_completions, :date, :date, null: false
  end
end
