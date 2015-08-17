class Production < ActiveRecord::Base

  has_many :events, dependent: :destroy
  belongs_to :user

  validates :title, presence: true, length: { minimum: 5 }

end
