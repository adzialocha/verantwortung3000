module Boardable

  extend ActiveSupport::Concern

  included do

    validate :is_description_set

    def is_description_set

      if self.is_unreferenced?

        if self.description.empty?
          errors.add(:description, I18n.t('productions.event.form.error_description_needed'))
        end

        if self.title.empty?
          errors.add(:title, I18n.t('productions.event.form.error_title_needed'))
        end

      end

    end

  end

end
