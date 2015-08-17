class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :instruments
  has_many :devices
  has_many :productions

end
