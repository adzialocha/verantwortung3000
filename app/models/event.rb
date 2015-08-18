class Event < ActiveRecord::Base

  belongs_to :production

  belongs_to :location

  has_and_belongs_to_many :event_categories, :join_table => :event_categories_events, dependent: :destroy

  has_many :requirements, dependent: :destroy
  has_many :devices, through: :requirements

  has_many :collaborations, dependent: :destroy
  has_many :instruments, through: :collaborations

end
