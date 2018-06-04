class SearchListing
  def initialize(query)
    @query = query
  end

  def top_cuisines
    service.top_cuisines_search.map do |cuisine|
      Cuisine.new(cuisine)
    end
  end

  def top_restaurants
    service.top_restaurants_search.map do |restaurant|
      Restaurant.new(restaurant)
    end
  end

  private
    attr_reader :query

    def service
      @service ||= SearchListingService.new(query)
    end
end
