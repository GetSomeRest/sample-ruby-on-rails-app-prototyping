class WelcomeController < ApplicationController
  def index
    if current_user.judgep == "autodesk"
      current_user.judge = true
    else
      current_user.judge = false
    end
    current_user.save
    if current_user.judge
      @status = "judge"
    else
      if request.original_url.include?("urn")
        @status = "works"
      elsif Mod.all.count == 0
        @status = "none"
      elsif Mod.where(:uid => current_user.id).where(:latest => true).count != 0
        @status = "works"
        gon.urn = Mod.where(:uid => current_user.id).where(:latest => true).first.urn
      else
        @status = "noviewable"
      end
      token = JSON.parse(CurbFu.post({:host => 'developer.api.autodesk.com', :path => '/authentication/v1/authenticate', :protocol => "https"}, { :client_id => current_user.key, :client_secret => current_user.secret, :grant_type => 'client_credentials' }).body)
      gon.token = token["access_token"]
    end
    @user = current_user
  end

  def upload
    @user = current_user
    token = JSON.parse(CurbFu.post({:host => 'developer.api.autodesk.com', :path => '/authentication/v1/authenticate', :protocol => "https"}, { :client_id => current_user.key, :client_secret => current_user.secret, :grant_type => 'client_credentials' }).body)
  	gon.token = token["access_token"]
    gon.key  = current_user.key
    @mod = Mod.new
  end

  def view
    @mods = Mod.where(uid: current_user.id)
  end
end
