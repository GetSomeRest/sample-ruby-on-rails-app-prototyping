class WelcomeController < ApplicationController
  def index
	response = CurbFu.post({:host => 'developer.api.autodesk.com', :path => '/authentication/v1/authenticate', :protocol => "https"}, { :client_id => current_user.key, :client_secret => current_user.secret, :grant_type => 'client_credentials' })
  	puts "startstartstartstartstartstartstart"
  	puts response.body
  	puts "endendendendendendendendendendend"
  	@t = response.body
  	@user = current_user
  end
end
