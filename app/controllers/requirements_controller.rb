class RequirementsController < ApplicationController

  def update

    requirement = Requirement.find(params[:id])

    if can? :update, requirement

      requirement.update :device_id => nil, :title => requirement.device.title, :description => requirement.device.description

      # UserMailer.inform_about_rejected_requirement(self.device.user, self).deliver_now

      redirect_to engagement_path, :notice => I18n.t('engagement.flash_requirement_rejected')

    end

  end

end
