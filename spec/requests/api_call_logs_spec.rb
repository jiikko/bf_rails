require 'rails_helper'

describe ApiCallLogsController do
  describe 'GET #index' do
    describe 'format: :html' do
      it 'be success' do
        BF::ApiCallLog.create!(api_type: :public_api, request_body: '/test?')
        BF::ApiCallLog.create!(api_type: :public_api, request_body: '/test?')
        BF::ApiCallLog.create!(api_type: :public_api, request_body: '/bar?')
        BF::ApiCallLog.create!(api_type: :private_api, request_body: '/foo?')
        BF::ApiCallLog.create!(api_type: :private_api, request_body: '/foo?')
        BF::ApiCallLog.create!(api_type: :private_api, request_body: '/foo?')
        get api_call_logs_path(format: :html)

        table_macher('table[data-name=public-api]') do
          <<~EOH
            | パス  | 回数 |
            | /test | 2    |
            | /bar  | 1    |
          EOH
        end
        table_macher('table[data-name=private-api]') do
          <<~EOH
            | パス  | 回数 |
            | /foo  | 3    |
          EOH
        end
      end
    end
    describe 'format: :js' do
      it 'be success' do
        BF::ApiCallLog.create!(api_type: :public_api)
        BF::ApiCallLog.create!(api_type: :private_api)
        get api_call_logs_path(format: :js), xhr: true
        expect(response.body.scan(/html\(1\)/).size).to eq(2)
      end
    end
  end
end
