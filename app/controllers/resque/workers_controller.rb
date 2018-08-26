class Resque::WorkersController < ApplicationController
  def index
    @workers = Resque.workers.select { |worker| worker.job.present? }.sort_by { |worker| worker.job['payload'].values }
    respond_to do |format|
      format.html
      format.js
    end
  end
end
