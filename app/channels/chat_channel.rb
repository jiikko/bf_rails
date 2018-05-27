class ChatChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams
    Rails.logger.info "#########################3333 subscribed: #{params.inspect}"
    stream_from 'm:1'
  end

  def receive(data)
    Rails.logger.info "receive #{params.inspect}"
  end
end
