class ProductionsController < ResourceController

  private

  def production_params

    params.require(:production).permit(
      :title, :description, :user_id,
      images_attributes: [ :id, :src, :_destroy ],
      events_attributes: [ :id, :title, :description, :location_id, :from, :to, :_destroy ]
    )

  end

end
