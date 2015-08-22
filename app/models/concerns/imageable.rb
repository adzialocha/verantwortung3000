module Imageable

  extend ActiveSupport::Concern

  included do

    has_many :images, as: :imageable, dependent: :delete_all
    accepts_nested_attributes_for :images, reject_if: :all_blank, allow_destroy: true

  end

end
