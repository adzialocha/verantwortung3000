class UserMailer < ApplicationMailer

  def inform_about_collaboration(user, collaboration)

    @user = user
    @collaboration = collaboration

    mail(to: @user.email, subject: t('mails.collaboration.subject'))

  end

  def inform_about_requirement(user, requirement)

    @user = user
    @requirement = requirement

    mail(to: @user.email, subject: t('mails.requirement.subject'))

  end

end
