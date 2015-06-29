class Mod < ActiveRecord::Base
  def new
  end
 
  def create
  	@skill = Skill.new(mod_params)
 
  	@skill.save
  	redirect_to '/'
  end
  private
  def mod_params
    params.require(:mod).permit(:title, :latest, :urn)
  end
end
