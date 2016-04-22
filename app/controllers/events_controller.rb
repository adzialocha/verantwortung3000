class EventsController < ResourceController

  nested_belongs_to :production

  def index
    redirect_to parent_url
  end

  def create

    if resource.attributes.has_key? 'user_id'
      resource.user_id = current_user.id
    end

    create! do |success, failure|
      success.html { redirect_to edit_resource_url }
    end

  end

  private

  def event_params

    params.require(:event).permit(
      :id, :title, :description, :user_id, :from, :to, :location_id,
      images_attributes: [ :id, :src, :_destroy ],
      collaborations_attributes: [ :id, :title, :description, :instrument_id, :user_id, :_destroy ],
      requirements_attributes: [ :id, :title, :description, :device_id, :user_id, :_destroy ]
    )

  end

end
