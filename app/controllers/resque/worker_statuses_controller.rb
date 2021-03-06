class Resque::WorkerStatusesController < ApplicationController
  def index
    @worker_statuses = Resque.
      workers.
      map(&:job).
      group_by { |x| x.present? }.
      transform_values { |x| x.size }.
      transform_keys { |x| x ? :working : :idoling }
    @worker_count = @worker_statuses.values.sum
    @working_count = @worker_statuses[:working] || 0

    respond_to do |format|
      format.js
    end
  end
end
