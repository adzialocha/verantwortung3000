class Device < ActiveRecord::Base

  include Imageable

  has_many :requirements, dependent: :nullify
  has_many :events, through: :requirements

  belongs_to :user

end
