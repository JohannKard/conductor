class HabitCompletionsController < ApplicationController
  before_action :authenticate_user!

  def update
    @habit = current_user.habits.find(params[:id])
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    puts @date.to_s
    @habit_completion = @habit.habit_completions.find_or_initialize_by(date: @date)
    puts @habit_completion.completed
    @habit_completion.completed = params[:habit_completion][:completed] == '1'
    puts @habit_completion.completed

    if @habit_completion.save
      redirect_to daily_overview_path(id: @date), notice: 'Habit completion updated successfully.'
    else
      redirect_to daily_overview_path(id: @date), alert: 'Failed to update habit completion.'
    end
  end
end