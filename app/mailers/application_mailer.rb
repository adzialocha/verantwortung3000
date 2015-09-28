class ApplicationMailer < ActionMailer::Base

  add_template_helper ApplicationHelper

  default from: "VERANTWORTUNG 3000 <kontakt@verantwortung3000.de>"
  layout 'mailer'

end
