class Admin::ResourcesController < AdminController

  inherit_resources

  def index
    super
  end

  def create
    super
  end

  def show
    redirect_to edit_resource_path(permitted_params[:id])
  end

  def update
    super
  end

  def destroy
    super
  end

  protected

  def permitted_params
    params.permit!
  end

end
