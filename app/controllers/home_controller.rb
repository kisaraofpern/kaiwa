class HomeController < ApplicationController
  def index
    @query = params[:search] || nil
    @titles = []
    if @query && !@query.empty?
      binding.pry
      @titles = Title.search(params[:search])
    end
  end
end
