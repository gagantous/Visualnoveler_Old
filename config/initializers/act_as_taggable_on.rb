ActsAsTaggableOn::Tag.class_eval do
  extend FriendlyId

  friendly_id :name, use: [:slugged, :finders]
  def should_generate_new_friendly_id?
      slug.blank? || title_changed?
  end
end