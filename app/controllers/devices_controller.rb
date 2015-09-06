class DevicesController < BaseController

  private

  def device_params

    params.require(:device).permit(
      :title, :description, :user_id,
      images_attributes: [:id, :src, :_destroy]
    )

  end

end
