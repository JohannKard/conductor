class WeeksController < ApplicationController
    before_action :authenticate_user!
    before_action :set_week, only: [:update, :destroy]
  
    def index
      @weeks = current_user.weeks.order(start_date: :desc)
      @date = params[:date] ? Date.parse(params[:date]) : Date.today
      @week = @weeks.first || current_user.weeks.create(start_date: @date.beginning_of_week, end_date: @date.end_of_week)
      @habits = @week.habits
    end
  
    def create
      @week = current_user.weeks.build(week_params)
      if @week.save
        redirect_to weeks_path(date: @date), notice: 'Week was successfully created.'
      else
        redirect_to weeks_path(date: @date), alert: 'Failed to create week.'
      end
    end
  
    def update
      if @week.update(week_params)
        redirect_to weeks_path(date: @date), notice: 'Week was successfully updated.'
      else
        redirect_to weeks_path(date: @date), alert: 'Failed to update week.'
      end
    end
  
    def destroy
      @week.destroy
      redirect_to weeks_path(date: @date), notice: 'Week was successfully deleted.'
    end
  
    private
  
    def set_week
      @week = current_user.weeks.find(params[:id])
      @date = params[:date] ? Date.parse(params[:date]) : Date.today
    end
  
    def week_params
      params.require(:week).permit(:start_date, :end_date)
    end
  end