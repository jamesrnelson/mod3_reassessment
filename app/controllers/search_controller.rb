class SearchController < ApplicationController
  def index
    @cuisines = SearchListing.new(params[:search]).top_cuisines[0..4]
    @restaurants = SearchListing.new(params[:search]).top_restaurants
  end
end
