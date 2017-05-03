class HomeController < ApplicationController
  def index
    @titles = []
    if params[:search] && !params[:search].empty?
      @titles = Title.search(params[:search])
    end
  end
end
