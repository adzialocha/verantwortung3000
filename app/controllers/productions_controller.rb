class ProductionsController < ResourceController

  def create
    create!(:notice => "Production created!") { edit_production_url(@production) }
  end

  private

  def production_params

    params.require(:production).permit(
      :title, :description, :user_id,
      images_attributes: [ :id, :src, :_destroy ],
      events_attributes: [ :id, :title, :description, :location_id, :from, :to, :_destroy ]
    )

  end

end
