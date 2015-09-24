class DeviseMailer < Devise::Mailer

  add_template_helper ApplicationHelper

  include Devise::Controllers::UrlHelpers

  layout 'mailer'

end
