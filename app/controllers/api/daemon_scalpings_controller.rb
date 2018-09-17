class Api::DaemonScalpingsController < ApplicationController
  def create
    respond_to do |format|
      format.js do 
        if BF::DaemonScalpingWorker.doing?
          @message = 'BF::DaemonScalpingWorkerが実行中のため何もしませんでした'
          render 'shared/dialog'
        else
          BF::DaemonScalpingWorker.perform_async
          @message = 'BF::DaemonScalpingWorkerを実行します'
          render 'shared/dialog'
        end
      end
    end
  end
end
