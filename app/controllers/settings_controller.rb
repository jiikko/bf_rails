class SettingsController < ApplicationController
  def edit
    @setting = BF::Setting.record
  end

  def update
    @setting = BF::Setting.record
    if @setting.update(setting_params)
      redirect_to edit_setting_path, notice: '更新しました'
    else
      render :edit
    end
  end

  private

  def setting_params
    params.require(:bf_setting).permit!
  end
end
