class WelcomeController < ApplicationController
  def index
	response = JSON.parse(CurbFu.post({:host => 'developer.api.autodesk.com', :path => '/authentication/v1/authenticate', :protocol => "https"}, { :client_id => current_user.key, :client_secret => current_user.secret, :grant_type => 'client_credentials' }).body)
  	puts "startstartstartstartstartstartstart"
	puts response["token_type"]
  	puts "endendendendendendendendendendend"
  	@t = response["token_type"]
  	@user = current_user
  end

  def view
  	
  end
end
