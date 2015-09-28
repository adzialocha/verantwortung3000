class RequirementsController < ApplicationController

  def update

    requirement = Requirement.find(params[:id])

    if can? :update, requirement

      UserMailer.inform_about_rejected_requirement(requirement.event.production.user, requirement).deliver_now

      requirement.update :device_id => nil, :title => requirement.device.title, :description => requirement.device.description

      redirect_to engagement_path, :notice => I18n.t('engagement.alert_requirement_rejected')

    end

  end

end
