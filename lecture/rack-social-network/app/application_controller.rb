class ApplicationController

  def call(env)
    @req = Rack::Request.new(env)
    @resp = Rack::Response.new

    if @req.path.match("search")
      search_action
    elsif @req.path.match("about")
      about_action
    elsif @req.path == "/"
      homepage_action
    else
      @resp.write "404"
      @resp.status = 404
    end

    
    @resp.finish
  end

  def search_action
    db = Database.new

    results = db.search(@req.params["name"])
    if results
      @resp.write "#{@req.params["name"]} is a #{results}"
    else
      @resp.write "I don't know who #{@req.params["name"]} is..."
    end
  end

  def about_action
    @resp.write "I am about page"
  end

  def homepage_action
    @resp.write "I am homepage"
  end

end

class Database
  def search(name)
    data = {
      "Avi" => "Teacher",
      "Grace" => "Programmer",
    }
    data[name]
  end
end


# /search?name=Avi #=> "Avi is a teacher"
# /search?name=Grace #=> "Grace is a programmer"
# /search?name=Bob #=> "I don't know who bob is"
# /about #=> "I am an application"
# / #=> "Welcome!!!"

