
# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://www.visualnoveler.com"

SitemapGenerator::Sitemap.create do

  add '/pages/about'
  add '/pages/recommendation'
  add '/pages/help'
  add '/pages/resources'
  add '/genres'
  add '/developers'
  add '/vns'
  add '/vns/top'
  add '/vns/translated'
  add '/vns/walkthroughs'
  add '/genres/all'
  add '/developers/all'

  Vn.find_each do |vn|
    add vn_path(vn), lastmod: vn.updated_at
    add characters_vn_path(vn),lastmod: vn.updated_at
    vn.reviews.each do |review|
      add vn_review_path(vn,review),lastmod: review.updated_at
    end
  end

  User.find_each do |user|
    add user_path(user), lastmod: user.updated_at
    add watch_user_path(user), lastmod: user.updated_at
    add favourite_user_path(user), lastmod: user.updated_at
    add library_user_path(user), lastmod: user.updated_at
   # add drop_path(user), lastmod: user.updated_at
   # add wishlist_path(user), lastmod: user.updated_at
  end

  Genre.find_each do |genre|
    add genre_path(genre), lastmod: genre.updated_at
  end

  Developer.find_each do |developer|
    add developer_path(developer), lastmod: developer.updated_at
  end

  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end
