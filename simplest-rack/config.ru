require 'rack'

class Application

  def call(env)
    [
      200, 
      {"content-type" => "text/html"}, 
      ["Hello World! The time is #{Time.now}"]
    ]
  end

end

run Application.new