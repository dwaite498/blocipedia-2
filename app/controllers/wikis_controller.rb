class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def delete
  end
end
