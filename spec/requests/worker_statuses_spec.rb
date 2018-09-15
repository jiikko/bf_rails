require 'rails_helper'

describe WorkerStatusesController do
  describe '#index' do
    it 'be success' do
      idol_workers = 3.times.map { OpenStruct.new(job: {}) }
      working_workers = 1.times.map { OpenStruct.new(job: 1) }
      allow_any_instance_of(Resque).to receive(:workers) {
        idol_workers + working_workers
      }
      get worker_statuses_path(format: :js), xhr: true
      expect(response.body).to include('25 % (1/4)')
    end
  end
end
