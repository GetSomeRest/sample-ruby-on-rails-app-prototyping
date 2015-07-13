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
      @users = User.where.not(judge: true)
    else
      if request.original_url.include?("urn")
        @status = "works"
        token = JSON.parse(CurbFu.post({:host => 'developer.api.autodesk.com', :path => '/authentication/v1/authenticate', :protocol => "https"}, { :client_id => current_user.key, :client_secret => current_user.secret, :grant_type => 'client_credentials' }).body)
        gon.token = token["access_token"]
      elsif Mod.where(:uid => current_user.id).count == 0
        @status = "none"
      elsif Mod.where(:uid => current_user.id).where(:latest => true).count != 0
        @status = "works"
        gon.urn = Mod.where(:uid => current_user.id).where(:latest => true).first.urn
        token = JSON.parse(CurbFu.post({:host => 'developer.api.autodesk.com', :path => '/authentication/v1/authenticate', :protocol => "https"}, { :client_id => current_user.key, :client_secret => current_user.secret, :grant_type => 'client_credentials' }).body)
        gon.token = token["access_token"]
      else
        @status = "noviewable"
      end
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
    @main = current_user
    if current_user.judge
      if request.original_url.include?("uid")
        if Mod.where(:uid => params[:uid]).count == 0
          @status = "nomodel"
        elsif Mod.where(:uid => params[:uid]).where(:latest => true).count == 0
          @status = "noviewable"
        else
          @status = "judge"
          @model = Mod.where(:uid => params[:uid]).where(:latest => true).first
          gon.urn = @model.urn
          @user = User.find(params[:uid])
          @check = @user.key
          token = JSON.parse(CurbFu.post({:host => 'developer.api.autodesk.com', :path => '/authentication/v1/authenticate', :protocol => "https"}, { :client_id => @user.key, :client_secret => @user.secret, :grant_type => 'client_credentials' }).body)
          gon.token = token["access_token"]
        end
      else
        @status = "noview"
      end
    else
      @mods = Mod.where(uid: current_user.id)
    end
  end
end
