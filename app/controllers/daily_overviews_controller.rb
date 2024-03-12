class DailyOverviewsController < ApplicationController
    before_action :authenticate_user!
  
    def show
      @date = Date.today
      @todos = current_user.todos.where(due_date: @date)
      @habits = current_user.habits.includes(:habit_completions).where(habit_completions: { date: @date })
      @notes = current_user.notes.where(date: @date)
    end
  end