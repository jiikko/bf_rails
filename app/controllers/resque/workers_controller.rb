class Resque::WorkersController < ApplicationController
  def index
    @workers = Resque.workers.select { |x| x.job.present? }
    respond_to do |format|
      format.html
      format.js
    end
  end
end
