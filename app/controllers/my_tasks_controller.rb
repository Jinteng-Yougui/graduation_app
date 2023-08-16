class MyTasksController < ApplicationController
  protect_from_forgery

  def list
    @my_tasks = MyTask.order(posted_date: "DESC").all
  end

  def show
    id = params[:id]
    @my_task = MyTask.find(id)
  end

  def create
    WaitWorker.perform_async(5, params.to_json)
    redirect_to '/my_tasks'
  end
end