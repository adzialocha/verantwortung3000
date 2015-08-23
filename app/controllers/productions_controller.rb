class ProductionsController < ApplicationController

  load_and_authorize_resource

  def index
    @productions = Production.all
  end

  def show
    @production = Production.find(params[:id])
  end

  def new
    @production = Production.new
  end

  def edit
    @production = Production.find(params[:id])
  end

  def create

    @production = Production.new(resource_params)
    @production.user_id = current_user.id

    if @production.save
      redirect_to @production, :notice => 'Created'
    else
      render 'new'
    end

  end

  def update

    @production = Production.find(params[:id])

    if @production.update(resource_params)
      redirect_to @production, :notice => 'Updated'
    else
      render 'edit'
    end

  end

  def destroy
    @production = Production.find(params[:id])
    @production.destroy
    redirect_to productions_path, :notice => 'Deleted'
  end

  private

  def resource_params

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
