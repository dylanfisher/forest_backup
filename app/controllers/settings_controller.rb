class SettingsController < ApplicationController
  before_action :set_setting, only: [:edit, :update]

  has_scope :by_id
  has_scope :by_key
  has_scope :by_created_at

  layout 'admin'

  # GET /settings/1/edit
  def edit
  end

  # PATCH/PUT /settings/1
  def update
    if @setting.update(setting_params)
      redirect_to @setting, notice: 'Setting was successfully updated.'
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_setting
      @setting = Setting.friendly.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def setting_params
      params.require(:setting).permit(:title, :slug, :value)
    end
end
