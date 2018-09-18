class Api::ScalpingsController < ApplicationController
  def create
    BF::ScalpingWorker.perform_async
    respond_to do |format|
      format.js do
        @message = '自動注文を行います'
        render 'shared/dialog'
      end
    end
  end
end
