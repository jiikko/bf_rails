require 'rails_helper'

describe Resque::JobsController do
  before do
    allow(BF::ResqueHelper).to receive(:kill_all)
    allow(BF::ResqueHelper).to receive(:kill_one)
  end

  describe 'DELETE #destroy' do
    it 'be success' do
      delete resque_job_path(9999999999999999999999, format: :js)
      expect(response.body).to include('dialog')
      expect(response).to be_success
    end
  end

  describe 'DELETE #destroy_all' do
    it 'be success' do
      delete destroy_all_resque_jobs_path(format: :js)
      expect(response.body).to include('dialog')
      expect(response).to be_success
    end
  end
end
