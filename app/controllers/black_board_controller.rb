class BlackBoardController < ApplicationController

  before_action :authenticate_user!

  def index

    @collaborations = Collaboration.all_uncomplete
    @requirements = Requirement.all_uncomplete

  end

end
