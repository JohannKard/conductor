class NotesHistoryController < ApplicationController
    before_action :authenticate_user!
  
    def index
      @dates = current_user.notes.distinct.order(date: :desc).pluck(:date)
    end
  
    def show
      @date = Date.parse(params[:id])
      @notes = current_user.notes.where(date: @date).order(created_at: :asc)
    end
  end