class HabitsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_habit, only: [:update, :destroy]

    def create
      @week = current_user.weeks.find_or_create_by(start_date: Date.today.beginning_of_week, end_date: Date.today.end_of_week)
      @habit = @week.habits.build(habit_params)
      if @habit.save
        redirect_to weeks_path, notice: 'Habit was successfully created.'
      else
        redirect_to weeks_path, alert: 'Failed to create habit.'
      end
    end
  
    def update
      if @habit.update(habit_params)
        redirect_to daily_overview_path, notice: 'Habit was successfully updated.'
      else
        redirect_to daily_overview_path, alert: 'Failed to update habit.'
      end
    end
  
    def destroy
      @habit.destroy
      redirect_to weeks_path, notice: 'Habit was successfully deleted.'
    end
  
    private
  
    def set_habit
      @habit = current_user.habits.find(params[:id])
    end
  
    def habit_params
      params.require(:habit).permit(:name)
    end
  end