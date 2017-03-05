class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
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
    
    if @wikis.save 
      redirect_to @wikis, notice: "New wiki was saved successfully."
    else
      flash.now[:alert] = "There was an error, new wiki not saved."
      render :new
    end
  end

  def edit
  end

  def delete
  end
end
