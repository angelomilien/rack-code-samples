class ApplicationController

  def call(env)
    @resp = Rack::Response.new
    @req = Rack::Request.new(env)

    if @req.path.match(/hello/)
      hello_action
    elsif @req.path.match(/search/)
      search_action
    else
      root_action
    end

    @resp.finish
  end

  def hello_action
    name = @req.params["name"]
    @resp.write "Hello #{name}"
  end

  def search_action
    database = {"Avi" => "Teacher", "Grace" => "Programmer"}
    if database[@req.params["name"]]
      @resp.write "#{@req.params["name"]} is a #{database[@req.params["name"]]}"
    else
      @resp.write "I could not find a result for #{@req.params["name"]}"
    end
  end

  def root_action
    @resp.write "Hello World!"
  end
end