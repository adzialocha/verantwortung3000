class ActivityController < ApplicationController

  before_action :authenticate_user!

  def index
    @activities = PublicActivity::Activity.order('created_at DESC').paginate(:page => params[:page], :per_page => 50)
  end

end
