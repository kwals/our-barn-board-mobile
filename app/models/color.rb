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


  def self.find(hex, &block)
    this_api = API.new("https://api.github.com/")
    this_api.get(hex.to_s) do |response|
      puts response.data
      puts response.data.class
      puts response
      response.data
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