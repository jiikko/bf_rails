class Resque::JobsController < ApplicationController
  def destroy
    pid = Resque.workers.map(&:pid).find { |p| p == params[:pid].to_i }
    Process.kill(:USR1, pid)
    @message = '非同期ジョブの1つ停止しました'
    respond_to do |format|
      format.js
    end
  end

  def destroy_all
    pids = Resque.workers.select { |w| w.job.present? }.map(&:pid)
    pids.each { |pid| Process.kill(:USR1, pid) }
    @message = '非同期ジョブの全停止を実行しました'
    respond_to do |format|
      format.js
    end
  end
end
