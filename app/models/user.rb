class User < ActiveRecord::Base

    enum role: [:user, :vip, :admin]
  # validates :name, presence: true
    has_many :library_entries, dependent: :destroy
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy,:foreign_key => "post_author_id",:class_name =>"Comment"

    mount_uploader :poster_image, UserImageUploader
    crop_uploaded :poster_image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
   devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
     :omniauthable, :omniauth_providers => [:facebook]
  validate :image_size
  accepts_nested_attributes_for :library_entries
  accepts_nested_attributes_for :posts
  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
      end
  end

  private 
    def image_size
      if poster_image.size > 7.megabytes
        errors.add(:poster_image,"Should be less than 7 mb")
      end
    end
end
