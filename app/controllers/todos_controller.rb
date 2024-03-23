class TodosController < ApplicationController
    before_action :authenticate_user!
    before_action :set_todo, only: [:update, :destroy]
  
    def create
      @todo = current_user.todos.build(todo_params)
      @date = @todo.due_date
      if @todo.save
        redirect_to daily_overview_path(id: @date), notice: 'Todo was successfully created.'
      else
        redirect_to root_path, alert: 'Failed to create todo.'
      end
    end
  
    def update
      if @todo.update(todo_params)
        redirect_to daily_overview_path(id: @date), notice: 'Todo was successfully updated.'
      else
        redirect_to daily_overview_path(id: @date), alert: 'Failed to update todo.'
      end
    end
  
    def destroy
      @todo.destroy
      redirect_to daily_overview_path(id: @date), notice: 'Todo was successfully deleted.'
    end
  
    private
  
    def set_todo
      @todo = current_user.todos.find(params[:id])
      @date = @todo.due_date
    end
  
    def todo_params
      params.require(:todo).permit(:name, :completed, :due_date)
    end
  end