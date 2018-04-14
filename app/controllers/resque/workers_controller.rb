class Resque::WorkersController < ApplicationController
  def index
    @workers = Resque.workers.select { |x| x.job.present? }
  end
end
