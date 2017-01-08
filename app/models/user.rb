class User < ActiveRecord::Base
    enum role: [:user,:mod,:admin,:writer,:helper]
    after_initialize :set_default_role, :if => :new_record?
    before_create :add_to_list
    validates :name, presence: true
    has_many :library_entries, dependent: :destroy
    has_many :posts, dependent: :destroy
    has_many :news
    has_many :comments, dependent: :destroy,:foreign_key => "post_author_id",:class_name =>"Comment"
    has_many :reviews
    mount_uploader :poster_image, UserImageUploader
    mount_uploader :library_image, DefaultUploader
    mount_uploader :header_image, HeaderImageUploader
    validates :poster_image, file_size: { less_than: 2.megabytes }
    validates :library_image, file_size: { less_than: 2.megabytes }
    validates :header_image, file_size: { less_than: 2.megabytes }
    crop_uploaded :header_image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
     :omniauthable, :omniauth_providers => [:facebook,:twitter,:google_oauth2]
    #validates :name, presence: true,uniqueness: {case_sensitive: false}
    accepts_nested_attributes_for :library_entries
    accepts_nested_attributes_for :posts
    include PgSearch
    pg_search_scope :search_by_name, :against => :name,:using => {
                    :tsearch => {:prefix => true}
                  }
    extend FriendlyId

    friendly_id :name, use: [:slugged, :finders]


    def should_generate_new_friendly_id?
      slug.blank? || name_changed?
    end

    def add_to_list
      if Rails.env.production?
        gb = Gibbon::Request.new(api_key: ENV["MAILCHIMP_API_KEY"] )
        subscribe = gb.lists(ENV["MAILCHIMP_LIST_KEY"]).members.create(body: {email_address: self.email, status: "subscribed"})
      end
    end
    
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
          user.name = auth.info.name
          user.password = Devise.friendly_token[0,20]
          user.remote_poster_image_url = auth.info.image.gsub('http://','https://')
        end
    end

    def self.from_twitter_omniauth(auth,email)
       where(provider: auth["provider"], uid: auth["uid"]).first_or_create do |user|
          user.provider = auth["provider"]
          user.uid = auth["uid"]
          user.email = email
          user.name = auth["info"]["name"]
          user.password = Devise.friendly_token[0,20]
          user.remote_poster_image_url = auth["info"]["image"].gsub('http://','https://')
        end
    end

    def is_staff?
      return admin? || mod? || writer? || helper?
    end

end
