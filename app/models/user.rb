class User < ActiveRecord::Base

    enum role: [:user,:mod,:admin]
    after_initialize :set_default_role, :if => :new_record?
  # validates :name, presence: true
    has_many :library_entries, dependent: :destroy
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy,:foreign_key => "post_author_id",:class_name =>"Comment"
    has_many :reviews
    mount_uploader :poster_image, UserImageUploader
    crop_uploaded :poster_image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
     :omniauthable, :omniauth_providers => [:facebook]
    validate :image_size
    validates :name, presence: true
    accepts_nested_attributes_for :library_entries
    accepts_nested_attributes_for :posts
    extend FriendlyId
    friendly_id :name, use: [:slugged, :finders]

    def set_default_role
      # set default role and default settings
      self.bio = "A short bio about me"
      self.role ||= :user
      self.poster_image = "default_avatar.jpg"
    end

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
