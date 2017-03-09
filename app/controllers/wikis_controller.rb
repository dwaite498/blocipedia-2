class WikisController < ApplicationController
  def index
    @wikis = policy_scope(Wiki)
  end

  def show
    @wikis = Wiki.find(params[:id])
  end

  def new
    @wikis = Wiki.new
  end
  
  def create
    @wikis = Wiki.new
    @wikis.title = params[:wiki][:title]
    @wikis.body = params[:wiki][:body]
    @wikis.private = params[:wiki][:private]
    @wikis.user = current_user
    authorize @wikis
    if @wikis.save 
      redirect_to @wikis, notice: "New wiki was saved successfully."
    else
      flash.now[:alert] = "There was an error, new wiki not saved."
      render :new
    end
  end

  def edit
    @wikis = Wiki.find(params[:id])
    authorize @wikis
  end
  
  def update
    @wikis = Wiki.find(params[:id])
    @wikis.title = params[:wiki][:title]
    @wikis.body = params[:wiki][:body]
    @wikis.private = params[:wiki][:private]
    authorize @wikis
    if @wikis.save
      redirect_to @wikis
    else
      flash.now[:alert] = "There was an error updating the wiki, please try again."
      render :edit
    end
  end

  def destroy
    @wikis = Wiki.find(params[:id])
    authorize @wikis
    if @wikis.destroy
      redirect_to wikis_path
    else
      render :show
    end
  end
end
