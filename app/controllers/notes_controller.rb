class NotesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_note, only: [:destroy]
  
    def create
      @note = current_user.notes.build(note_params)
      @date = params[:date] ? Date.parse(params[:date]) : Date.today
      if @note.save
        redirect_to daily_overview_path(id: @date), notice: 'Note was successfully created.'
      else
        redirect_to daily_overview_path(id: @date), alert: 'Failed to create note.'
      end
    end
  
    def destroy
      @note.destroy
      @date = params[:date] ? Date.parse(params[:date]) : Date.today
      redirect_to daily_overview_path(id: @date), notice: 'Note was successfully deleted.'
    end
  
    private
  
    def set_note
      @note = current_user.notes.find(params[:id])
    end
  
    def note_params
      params.require(:note).permit(:content, :date)
    end
  end