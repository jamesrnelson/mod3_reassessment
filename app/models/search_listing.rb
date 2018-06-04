class SearchListing
  def initialize(query)
    @query = query
  end

  def top_cuisines
    service.top_cuisines_search.map do |cuisine|
      Cuisine.new(cuisine)
    end
  end

  private
    attr_reader :query

    def service
      @service ||= SearchListingService.new(query)
    end
end
