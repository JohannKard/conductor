class DailyOverviewsController < ApplicationController
  before_action :authenticate_user!

  def show
    begin
      @date = Date.parse(params[:id].to_s)
    rescue ArgumentError
      redirect_to root_path, alert: 'Invalid date provided' and return
    end

    @todos = current_user.todos.where(due_date: @date)
    @habits = current_user.habits.includes(:habit_completions).where(habit_completions: { date: @date })
    @notes = current_user.notes.where(date: @date)
  end
end