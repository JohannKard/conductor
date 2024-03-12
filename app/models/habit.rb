class Habit < ApplicationRecord
  belongs_to :user
  has_many :habit_completions, dependent: :destroy
  validates :name, presence: true

  def completed_for_date?(date)
    habit_completions.exists?(date: date)
  end
end