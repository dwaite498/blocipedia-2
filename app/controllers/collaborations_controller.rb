class CollaborationsController < ApplicationController
  def create
    @collaboration = Collaboration.new
    @collaboration.wiki_id = params[:wiki_id]
    @collaboration.user_id = params[:collaboration][:user_id]
    @collaboration.save
    redirect_to wiki_collaborations_path
  end
  
  def edit
    
  end
  
  def new
    @wiki = Wiki.find(params[:wiki_id])
    @collaboration = Collaboration.new(wiki_id: @wiki.id)
    
    @options = User.all.map do |u|
      [u.email, u.id]
    end
    

  end
  
  def index
    @collaborations = Collaboration.where(wiki_id: params[:wiki_id])
  end

  def destroy
    @collaboration = Collaboration.find(params[:id])
    user = @collaboration.user
    if @collaboration.destroy
      flash[:notice] = "Removed #{user.email} from collaborating on this wiki."
      redirect_to wiki_collaborations_path
    else
      flash[:alert] = "Error removing this user from collaborating in this wiki."
      redirect_to wiki_collaborations_path
    end
  end
  
end
