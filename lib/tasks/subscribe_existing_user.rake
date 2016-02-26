require 'rake'
  desc "Add to mailing list"
  task :add_to_mailing_list => :environment do
  	 gb = Gibbon::Request.new(api_key: "fed2ee444de2a19b223023584a313766-us12")
  	# emails = gb.lists("ab585714dd").members.retrieve(params: {"count": "50","fields": "members.email_address"})
    User.all.each_with_index do |user,index|	  
  	  begin
    	 subscribe = gb.lists("ab585714dd").members.create(body: {email_address: user.email, status: "subscribed"})
    	 p "#{user.email} is now subscribed to the mailing list"
    	rescue Gibbon::MailChimpError => e
    		if e.status_code == 400 
    			p "#{user.email} is already subscribed"
    		end
  		end

     end

    	
    	# p emails
      puts "Complete!"
  end