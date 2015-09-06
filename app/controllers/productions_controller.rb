class ProductionsController < ResourceController

  private

  def production_params

    params.require(:production).permit(
      :title, :description, :user_id,
      images_attributes: [:id, :src, :_destroy],
      events_attributes: [
        :id, :title, :description, :location_id, :from, :to, :_destroy,
        collaborations_attributes: [:id, :title, :description, :instrument_id, :user_id, :_destroy],
        requirements_attributes: [:id, :title, :description, :device_id, :user_id, :_destroy]
      ]
    )

  end

end
