class User < ActiveRecord::Base

  devise :database_authenticatable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable #, :registerable

  extend FriendlyId

  friendly_id :fullname, :use => [:slugged, :finders]

  has_many :instruments, dependent: :destroy
  has_many :devices, dependent: :destroy
  has_many :productions, dependent: :destroy

  mount_uploader :image, ImageUploader

  validates :email, :first_name, :last_name, :tel, :street, :city_code, :city, :country, :tos_accepted, presence: true

  default_scope { order('last_name') }

  def fullname
    self.first_name + ' ' + self.last_name
  end

end
