class SubscribeUserToMailingListJob < ActiveJob::Base
  queue_as :default

  def perform(user)
    gb = Gibbon::API.new
    render 'static_pages#help'
    gb.lists.subscribe({:id => "8b909befae", :email => {:email => "wraithseekers@gmail.com"}, :double_optin => false})
  end
end
