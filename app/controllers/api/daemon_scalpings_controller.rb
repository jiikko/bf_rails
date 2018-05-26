class Api::DaemonScalpingsController < ApplicationController
  def create
    respond_to do |format|
      format.js do 
        if BF::DaemonScalpingWorker.doing?
          return
        else
          BF::DaemonScalpingWorker.perform_async
          head :ok
        end
      end
    end
  end
end
