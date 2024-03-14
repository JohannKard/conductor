class AddCompletedToHabitCompletions < ActiveRecord::Migration[7.1]
  def change
    add_column :habit_completions, :completed, :boolean, default: false
  end
end
