class Api::DisparitiesController < ApiController
  def show
    @disparity = BF::Monitor.new.current_disparity_from_datastore
    respond_to do |format|
      format.js
    end
  end
end
