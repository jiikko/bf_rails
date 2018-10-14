class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def set_dialog_body(body, message_type: :notice)
    @dialog_body = render_to_string(
      partial: 'shared/dialog',
      locals: {
        body: body,
        css_class: message_type,
      })
  end
end
