module ApplicationCable
  class Channel < ActionCable::Channel::Base
    STREAM_NAME = 'm:1'
  end
end
