class InstrumentsController < BaseController

  private

  def instrument_params

    params.require(:instrument).permit(
      :title, :description, :user_id,
      images_attributes: [:id, :src, :_destroy]
    )

  end

end
