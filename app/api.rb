class API
  def initialize(base_url)
    @base_url = base_url
  end

  def get(path = "test", &block)
    request = create_request(path, :get)
    create_task(request, &block).resume
  end

  def post(path, params, &block)
    request = create_request(path, :post)
    add_params(request, params)
    create_task(request, &block).resume
  end

private
  
  def config
    NSURLSessionConfiguration.defaultSessionConfiguration
    # how can I change configuration here?
  end

  def session
    NSURLSession.sessionWithConfiguration(config)
  end

  def create_request(path, method)
    url = NSURL.URLWithString(@base_url + path)
    request = NSMutableURLRequest.requestWithURL(url)
    # request.addValue("token MYTOKEN", forHTTPHeaderField: "Authorization")
    # request.addValue("kwals", forHTTPHeaderField: "User-Agent")
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("application/json", forHTTPHeaderField: "Accept")
    request.setHTTPMethod(method.to_s.upcase)
    request
  end

  def add_params(request, params)
    data = create_json_data(params)
    request.setHTTPBody(data)
  end

  def create_json_data(params)
    NSJSONSerialization.dataWithJSONObject(params, options: 0, error: nil)
  end

  def create_task(request, &block)
    if block_given?
      session.dataTaskWithRequest(request, completionHandler: -> (data,response, error) {
        if error 
          puts error
          puts error.message
        end
        block.call(APIResponse.new(data, response, error))
        })
    else
      session.dataTaskWithRequest(request)
    end
  end

  class APIResponse
    attr_reader :success, :data, :error

    def initialize(data, response, error)
      @success = (200..299).include?(response.statusCode)
      @data = NSJSONSerialization.JSONObjectWithData(data, options: 0, error: nil)
      @error = error
    end

    def successful?
      @success
    end
  end
end



