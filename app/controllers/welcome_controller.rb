class WelcomeController < ApplicationController
  def index
  	@user = current_user
  end

  def upload
    token = JSON.parse(CurbFu.post({:host => 'developer.api.autodesk.com', :path => '/authentication/v1/authenticate', :protocol => "https"}, { :client_id => current_user.key, :client_secret => current_user.secret, :grant_type => 'client_credentials' }).body)
  	gon.token = token["access_token"]
    gon.key  = current_user.key
    @mod = Mod.new
  end

  def view
    @mods = Mod.all
  end
end
