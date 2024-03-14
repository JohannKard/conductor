class Habit < ApplicationRecord
  belongs_to :user
  belongs_to :week
  has_many :habit_completions, dependent: :destroy
  validates :name, presence: true
  validates :user, presence: true

  def completed_for_date?(date)
    habit_completions.exists?(date: date)
  end
end