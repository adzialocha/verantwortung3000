module Imageable

  extend ActiveSupport::Concern

  included do

    has_many :images, as: :imageable, dependent: :destroy
    accepts_nested_attributes_for :images, reject_if: :all_blank, allow_destroy: true

    def cover_image
      images.first
    end

  end

end
