class Color
  PROPERTIES = [:timestamp, :hex, :id, :tags]
  attr_accessor *PROPERTIES
  
  def initialize(hash = {})
    hash.each {|key, value| 
      if PROPERTIES.member? key.to_sym
        self.send((key.to_s + "=").to_s, value)
      end
    }
  end

  def parse_json(params)
    # NSJSONSerialization.dataWithJSONObject(params, options: 0, error: nil)
    NSJSONSerialization.objectWithData(params, options: 0, error: nil)

  end

  def self.find(hex, &block)
    this_api = API.new("http://www.colr.org/json/color/")
    this_api.get(hex.to_s) do |response|
      response_result = response.data
      intermediate_result = NSJSONSerialization.objectWithData(response_result, options: 0, error: nil)
       
       # intermediate_result = parse_json(response_result)
       color_result = intermediate_result["colors"][0]
      # So here is where we need parse from json

       # color_data = response_data["colors"][0]

       # color = Color.new(color_data)
       # if color.id.to_i < 0
       #  block.call(nil)
       # else 
       #  block.call(color)
       # end

     end
  end

  def tags
    @tags ||=[]
  end

  def tags=(tags)
    if tags.first.is_a? Hash
      tags = tags.collect { |tag| Tag.new(tag) }
    end
    tags.each { |tag| 
      if not tag.is_a? Tag 
        raise "Wrong class for attempted tag #{tag.inspect}"
      end
    }
    @tags = tags
  end

end