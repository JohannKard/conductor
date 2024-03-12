class CreateHabitCompletions < ActiveRecord::Migration[7.1]
  def change
    create_table :habit_completions do |t|

      t.timestamps
    end
  end
end
