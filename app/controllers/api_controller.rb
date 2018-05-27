class ApiController < ActionController::Base
  around_action do
    # こんなしたいのことがしたい
    # original_logger = Rails.logger
    # Rails.logger = Logger.new(File.join(Rails.root, 'log', 'api.log'))
    # yield
    # Rails.logger = original_logger
  end
end
