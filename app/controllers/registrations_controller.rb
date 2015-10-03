class RegistrationsController < Devise::RegistrationsController

  def create

    super

    resource.update :locale => I18n.locale

  end

end
