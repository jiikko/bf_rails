class ApiCallLogsController < ApplicationController
  def index
    count_table = BF::ApiCallLog.recent.group(:api_type).count
    @public_api_call_logs_count = count_table["public_api"] || 0
    @private_api_call_logs_count = count_table["private_api"] || 0
    respond_to do |format|
      format.js
    end
  end
end
