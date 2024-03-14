class DailyOverviewsController < ApplicationController
  before_action :authenticate_user!

  def show
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @todos = current_user.todos.where(due_date: @date)
    @habits = current_user.habits.includes(:habit_completions).where(week: current_user.weeks.find_by(start_date: @date.beginning_of_week, end_date: @date.end_of_week))
    @notes = current_user.notes.where(date: @date)
  end
end