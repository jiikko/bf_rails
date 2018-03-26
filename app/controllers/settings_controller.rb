class SettingsController < ApplicationController
  def toggle_fetch
    if BF::Setting.enable_fetch?
      BF::Setting.disable_fetch!
    else
      BF::Setting.enable_fetch!
    end
    redirect_to root_path
  end
end
