class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :instruments, dependent: :destroy
  has_many :devices, dependent: :destroy
  has_many :productions, dependent: :destroy

  mount_uploader :image, ImageUploader

  validates :email, :first_name, :last_name, :tel, :street, :city_code, :city, :country, presence: true

  def fullname
    self.first_name + ' ' + self.last_name
  end

end
