require 'rails_helper'

describe WorkerStatusesController do
  describe '#index' do
    it 'be success' do
      get worker_statuses_path(format: :js), xhr: true
      expect(response.body).to include('workerの稼働率')
    end
  end
end
