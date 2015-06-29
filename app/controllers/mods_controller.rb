class ModsController < ApplicationController
  def new
  end
 
  def create
  	@mod = Mod.new(mod_params)
 
  	@mod.save
  	redirect_to '/'
  end
  private
  def mod_params
    params.require(:mod).permit(:title, :latest, :urn)
  end
end
