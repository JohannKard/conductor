class CarryOverIncompleteTodosJob < ApplicationJob
  queue_as :default

  def perform
    Todo.carry_over_incomplete_todos
  end
end
