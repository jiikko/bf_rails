class Api::DaemonScalpingsController < ApplicationController
  def create
    respond_to do |format|
      format.js do 
        if BF::DaemonScalpingWorker.doing?
          set_dialog_body('BF::DaemonScalpingWorkerが実行中のため何もしませんでした', message_type: :error)
        else
          BF::DaemonScalpingWorker.perform_async
          set_dialog_body('BF::DaemonScalpingWorkerを実行します')
        end
        render 'shared/dialog'
      end
    end
  end
end
