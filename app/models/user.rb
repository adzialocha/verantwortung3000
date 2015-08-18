class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :instruments, dependent: :destroy
  has_many :devices, dependent: :destroy
  has_many :productions, dependent: :destroy

end
