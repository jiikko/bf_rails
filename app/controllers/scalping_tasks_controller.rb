class ScalpingTasksController < ApplicationController
  def index
    @tasks = BF::ScalpingTask.all
  end
end
