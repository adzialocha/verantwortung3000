class Instrument < ActiveRecord::Base

  has_many :collaborations, dependent: :nullify
  has_many :events, through: :collaborations

  belongs_to :user

end
