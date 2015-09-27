class ProductionsController < ResourceController

  def create

    if resource.attributes.has_key? 'user_id'
      resource.user_id = current_user.id
    end

    create!(:notice => t('productions.alert_create')) { edit_resource_url }

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
