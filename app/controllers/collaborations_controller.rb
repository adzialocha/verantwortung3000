class CollaborationsController < ApplicationController

  def update

    collaboration = Collaboration.find params[:id]

    if can? :update, collaboration

      collaboration.update :instrument_id => nil, :title => collaboration.instrument.title, :description => collaboration.instrument.description

      redirect_to engagement_path, :notice => I18n.t('engagement.alert_collaboration_rejected')

    end

  end

end
