class ResourceController < ApplicationController

  inherit_resources

  load_and_authorize_resource

  check_authorization

  # default actions

  def create

    if resource.attributes.has_key? 'user_id'
      resource.user_id = current_user.id
    end

    create!(:notice => "Successfully created.")

  end

  def update
    update!(:notice => "Successfully updated.")
  end

  def destroy
    destroy!(:notice => "Successfully deleted.")
  end

end
