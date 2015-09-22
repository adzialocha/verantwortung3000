class ApplicationMailer < ActionMailer::Base

  add_template_helper ApplicationHelper

  default from: "kontakt@blatt3000.de"
  layout 'mailer'

end
