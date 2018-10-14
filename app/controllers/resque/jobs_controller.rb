class Resque::JobsController < ApplicationController
  def destroy
    BF::ResqueHelper.kill_one(params[:pid])
    respond_to do |format|
      format.js do
        set_dialog_body('非同期ジョブの1つ停止しました')
        render :destroy
      end
    end
  end

  def destroy_all
    BF::ResqueHelper.kill_all
    respond_to do |format|
      format.js do
        set_dialog_body('非同期ジョブの全停止を実行しました')
        render 'shared/dialog'
      end
    end
  end
end
