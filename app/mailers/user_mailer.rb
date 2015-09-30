class UserMailer < ApplicationMailer

  def inform_about_collaboration(user, collaboration)

    @user = user
    @collaboration = collaboration

    I18n.with_locale(get_locale(user)) do
      mail(to: @user.email, subject: t('mails.collaboration.subject'))
    end

  end

  def inform_about_requirement(user, requirement)

    @user = user
    @requirement = requirement

    I18n.with_locale(get_locale(user)) do
      mail(to: @user.email, subject: t('mails.requirement.subject'))
    end

  end

  def inform_about_rejected_collaboration(user, collaboration)

    @user = user
    @collaboration = collaboration

    I18n.with_locale(@user.locale) do
      mail(to: @user.email, subject: t('mails.collaboration_rejected.subject'))
    end

  end

  def inform_about_rejected_requirement(user, requirement)

    @user = user
    @requirement = requirement

    I18n.with_locale(get_locale(user)) do
      mail(to: @user.email, subject: t('mails.requirement_rejected.subject'))
    end

  end

  private

  def get_locale(user)
    user.locale || I18n.locale
  end

end
