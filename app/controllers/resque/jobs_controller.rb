class Resque::JobsController < ApplicationController
  def destroy
    BF::ResqueHelper.kill_one(params[:pid])
    @message = '非同期ジョブの1つ停止しました'
    respond_to do |format|
      format.js
    end
  end

  def destroy_all
    BF::ResqueHelper.kill_all
    @message = '非同期ジョブの全停止を実行しました'
    respond_to do |format|
      format.js { render 'shared/dialog' }
    end
  end
end
