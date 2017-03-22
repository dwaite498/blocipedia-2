class CollaborationsController < ApplicationController
  def create
    @collaboration = Collaboration.new
    @wiki = Wiki.find(params[:wiki_id])
    @collaboration.wiki_id = params[:wiki_id]
    @collaboration.user_id = params[:collaboration][:user_id]
    if @wiki.collaborations.any?{ |c| c.user.id == @collaboration.user_id}
      flash[:alert] = "This user is already collaborating on this wiki, please choose another user"
      redirect_to wiki_collaborations_path
    else
      @collaboration.save
      redirect_to wiki_collaborations_path
    end
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
