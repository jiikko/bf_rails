class ApiCallLogsController < ApplicationController
  def index
    count_table = BF::ApiCallLog.recent.group(:api_type).count
    @public_api_call_logs_count = count_table["public_api"]
    @private_api_call_logs_count = count_table["private_api"]
    respond_to do |format|
      format.js
    end
  end
end
