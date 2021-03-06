class SearchListingService
  def initialize(query)
    @query = query
  end

  def city_search
    JSON.parse(first_response.body, symbolize_names: true)
  end

  def top_cuisines_search
    JSON.parse(second_response.body, symbolize_names: true)[:cuisines]
  end

  def city_id
    city_search[:location_suggestions].first[:id]
  end

  def top_restaurants_search
    JSON.parse(third_response.body, symbolize_names: true)[:restaurants]
  end

  private
    attr_reader :query

    def first_connection
      Faraday.new(url: "https://developers.zomato.com/api/v2.1/cities?q=#{query}")
    end

    def first_response
      first_connection.get do |req|
        req.headers['user-key'] = ENV['ZOMATO_API_KEY']
      end
    end

    def second_connection
      Faraday.new(url: "https://developers.zomato.com/api/v2.1/cuisines?city_id=#{city_id}")
    end

    def second_response
      second_connection.get do |req|
        req.headers['user-key'] = ENV['ZOMATO_API_KEY']
      end
    end

    def third_connection
      Faraday.new(url: "https://developers.zomato.com/api/v2.1/search?entity_id=#{city_id}&entity_type=city&count=5&sort=rating&order=desc")
    end

    def third_response
      third_connection.get do |req|
        req.headers['user-key'] = ENV['ZOMATO_API_KEY']
      end
    end
end
