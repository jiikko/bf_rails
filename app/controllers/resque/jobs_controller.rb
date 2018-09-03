class Resque::JobsController < ApplicationController
  def destroy
    pid = Resque.workers.map(&:pid).find { |p| p == params[:pid].to_i }
    Process.kill(:USR1, pid)
    respond_to do |format|
      format.js
    end
  end
end
