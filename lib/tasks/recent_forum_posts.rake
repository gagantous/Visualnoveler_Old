require 'rake'
  desc "Get latest forum posts"
  task :get_recent_posts => :environment do
    tries ||= 3
    url = "https://forums.visualnoveler.com/latest.json"
    BASE_URL = "https://forums.visualnoveler.com/t/"
    begin
      forum_json = JSON.load open(url)
    rescue OpenURI::HTTPError => error
        puts "#{error}, retrying..."
        sleep(2.minutes)
        retry unless (tries -= 1).zero?
    end
    forum_json["topic_list"]["topics"].take(6).map do |topic|
      title = topic["title"]
      url = BASE_URL + topic["slug"]
      time = topic["last_posted_at"]
      reply_count = topic["reply_count"]
      post = ForumPost.find_or_create_by(title: title,link: url)
      post.reply_count = reply_count
      post.date_time = time
      post.save
    end
    puts "Success"  
  end