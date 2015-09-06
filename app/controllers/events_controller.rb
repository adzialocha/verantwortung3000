class EventsController < ResourceController

  nested_belongs_to :production

  private

  def event_params

    params.require(:event).permit(
      :title, :description, :user_id, :from, :to, :location_id,
      images_attributes: [:id, :src, :_destroy]
    )

  end

end
