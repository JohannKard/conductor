class HabitCompletion < ApplicationRecord
    belongs_to :habit
    validates :habit_id, presence: true
    validates :date, presence: true, uniqueness: { scope: :habit_id }
  
    scope :completed, -> { where(completed: true) }
    scope :not_completed, -> { where(completed: false) }
  end