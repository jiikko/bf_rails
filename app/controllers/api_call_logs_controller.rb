class ApiCallLogsController < ApplicationController
  def index
    respond_to do |format|
      format.html do
        api_call_log_table = BF::ApiCallLog.recent.group_by(&:api_type)
        @public_api = api_call_log_table["public_api"].map { |x| x.request_body =~ /^(.+?)\?/ && $1 }
        @public_api_table = {}.tap do |hash|
          @public_api.each do |key, value|
            hash[key] ||= 0
            hash[key] = hash[key] + 1
          end
          hash
        end

        @private_api = api_call_log_table["private_api"].map { |x| x.request_body =~ /^(.+?)\?/ && $1 }
        @private_api_table = {}.tap do |hash|
          @private_api.each do |key, value|
            hash[key] ||= 0
            hash[key] = hash[key] + 1
          end
          hash
        end
      end
      format.js do
        count_table = BF::ApiCallLog.recent.group(:api_type).count
        @public_api_call_logs_count = count_table["public_api"] || 0
        @private_api_call_logs_count = count_table["private_api"] || 0
      end
    end
  end
end
