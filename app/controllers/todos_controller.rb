class TodosController < ApplicationController
  layout "app"
  skip_forgery_protection

  def index
    @todos = Todo.all.order("created_at DESC")
  end

  def uncompleted
    @todos = Todo.where(done: false)
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def create
    todo = Todo.create(todo_param)
    render json: todo
  end

  def update
    todo = Todo.find(params[:id])
    todo.update!(todo_param)
    render json: todo
  end

  def update_form
    todo = Todo.find(params[:id])
    todo.update!(todo_param)
    render json: todo
  end

  def destroy
    todo = Todo.find(params[:id])
    todo.destroy
    head :no_content, status: :ok
  end

  private
    def todo_param
      params.require(:todo).permit(:title, :description, :done)
    end
end