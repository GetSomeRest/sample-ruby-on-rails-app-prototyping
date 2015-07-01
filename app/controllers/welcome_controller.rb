class WelcomeController < ApplicationController
  def index
  	@user = current_user
    gon.urn = "dXJuOmFkc2sub2JqZWN0czpvcy5vYmplY3Q6bW9kZWwyMDE1LTA3LTAxLTA4LTM1LTExLXl0a3RxY2huZG93M3NvejM5N2p3dnhzZWNvZjEvR2F0ZUhvdXNlLm53ZA=="
    token = JSON.parse(CurbFu.post({:host => 'developer.api.autodesk.com', :path => '/authentication/v1/authenticate', :protocol => "https"}, { :client_id => current_user.key, :client_secret => current_user.secret, :grant_type => 'client_credentials' }).body)
    gon.token = token["access_token"]
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
