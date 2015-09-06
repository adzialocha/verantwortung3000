class EventsController < ResourceController

  nested_belongs_to :production

  def index
    redirect_to parent_url
  end

  private

  def event_params

    params.require(:event).permit(
      :title, :description, :user_id, :from, :to, :location_id,
      images_attributes: [:id, :src, :_destroy]
    )

  end

end
