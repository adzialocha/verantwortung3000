class InstrumentsController < ApplicationController

  load_and_authorize_resource

  def index
    @instruments = Instrument.all
  end

  def show
    @instrument = Instrument.find(params[:id])
  end

  def new
    @instrument = Instrument.new
  end

  def edit
    @instrument = Instrument.find(params[:id])
  end

  def create

    @instrument = Instrument.new(resource_params)

    if @instrument.save
      redirect_to @instrument, :notice => 'Created'
    else
      render 'new'
    end

  end

  def update

    @instrument = Instrument.find(params[:id])

    if @instrument.update(resource_params)
      redirect_to @instrument, :notice => 'Updated'
    else
      render 'edit'
    end

  end

  def destroy
    @instrument = Instrument.find(params[:id])
    @instrument.destroy
    redirect_to instruments_path, :notice => 'Deleted'
  end

  private

  def resource_params

    params.require(:instrument).permit(
      :title, :description, :user_id
      images_attributes: [:id, :src, :_destroy]
    )

  end

end
