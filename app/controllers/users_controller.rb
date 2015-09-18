class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:index]

  def show
    @user = User.find(params[:id])
    @user_events = Event.where(:user_id => @user.id)
  end

  def index
    @users = User.all
  end

end
