class PagesController < ApplicationController

  def show
    @content = Page.find(params[:id])
  end

end
