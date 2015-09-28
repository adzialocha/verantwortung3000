class BlackBoardController < ApplicationController

  before_action :authenticate_user!

  def index

    @collaborations = Collaboration.all_uncomplete.order('updated_at DESC')
    @requirements = Requirement.all_uncomplete.order('updated_at DESC')

  end

end
