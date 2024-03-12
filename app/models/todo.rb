class Todo < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :due_date, presence: true

  scope :incomplete, -> { where(completed: false) }

  def due_today?
    due_date == Date.today
  end

  def self.carry_over_incomplete_todos
    incomplete.where('due_date < ?', Date.today).update_all(due_date: Date.today)
  end
end
