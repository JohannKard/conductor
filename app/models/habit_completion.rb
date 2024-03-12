class HabitCompletion < ApplicationRecord
    belongs_to :habit
    validates :habit, :date, presence: true
end