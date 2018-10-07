class ApiCallLogsController < ApplicationController
  def index
    respond_to do |format|
      format.html { set_variables_count_by_path }
      format.js { set_variables_count_by_api_type }
    end
  end

  private

  def set_variables_count_by_api_type
    count_table = BF::ApiCallLog.recent.group(:api_type).count
    @public_api_call_logs_count = count_table["public_api"] || 0
    @private_api_call_logs_count = count_table["private_api"] || 0
  end

  def set_variables_count_by_path
    api_call_log_table = BF::ApiCallLog.recent.group_by(&:api_type)
    public_api_paths = (api_call_log_table["public_api"] || []).map { |x| x.request_body =~ /^(.+?)\?/ && $1 }
    @public_api_table = count_by_path(public_api_paths)
    private_api_paths = (api_call_log_table["private_api"] || []).map { |x| x.request_body =~ /^(.+?)\?/ && $1 }
    @private_api_table = count_by_path(private_api_paths)
  end

  def count_by_path(paths)
    Hash.new { |h,k| h[k] = 0 }.tap do |hash|
      paths.each { |path| hash[path] = hash[path] + 1 }
    end
  end
end
