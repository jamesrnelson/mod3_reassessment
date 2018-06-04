class Restaurant
  attr_reader :name, :address, :locality
  def initialize(attrs)
    @name = attrs[:restaurant][:name]
    @address = attrs[:restaurant][:location][:address]
    @locality = attrs[:restaurant][:location][:locality]
  end
end
