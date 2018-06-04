class Cuisine
  attr_reader :type
  
  def initialize(attrs)
    @type = attrs[:cuisine][:cuisine_name]
  end
end
