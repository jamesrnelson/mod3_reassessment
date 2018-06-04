class SearchController < ApplicationController
  def index
    @results = SearchListing.new(params[:search])
  end
end
