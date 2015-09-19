class ResourceController < ApplicationController

  inherit_resources

  load_and_authorize_resource

  check_authorization

  # default actions

  def create

    if resource.attributes.has_key? 'user_id'
      resource.user_id = current_user.id
    end

    create!(:notice => t("#{resource.model_name.human.pluralize.downcase}.alert_create"))

  end

  def update
    update!(:notice => t("#{resource.model_name.human.pluralize.downcase}.alert_update"))
  end

  def destroy
    destroy!(:notice => t("#{resource.model_name.human.pluralize.downcase}.alert_delete"))
  end

end
