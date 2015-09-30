class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  extend FriendlyId

  friendly_id :fullname, :use => [:slugged, :finders]

  has_many :instruments, dependent: :destroy
  has_many :devices, dependent: :destroy
  has_many :productions, dependent: :destroy

  mount_uploader :image, ImageUploader

  validates :email, :first_name, :last_name, :tel, :street, :city_code, :city, :country, presence: true

  default_scope { order('last_name') }

  after_create :set_locale

  def fullname
    self.first_name + ' ' + self.last_name
  end

  private

  def set_locale
    self.update :locale => I18n.locale
  end

end
