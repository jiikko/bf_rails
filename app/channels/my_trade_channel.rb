class MyTradeChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams
    Rails.logger.info "[MyTradeChannel] subscribed: #{params.inspect}"
    stream_from ApplicationCable::Channel::STREAM_NAME
  end

  def receive(data)
    Rails.logger.info "receive #{params.inspect}"
  end
end
