require 'net/http'
require 'json'
require 'date'

class Api::V1::TitleapiController < Api::V1::BaseController
  def index
    all_titles = Title.pluck(:full_title)
    render :json => all_titles
  end
end
