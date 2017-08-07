require 'rack'
require 'shotgun'
require 'pry'

class Application
  def call(env)
    binding.pry
    [200, {"content-type" => "text/html"}, ["Live Reloading"]]
  end
end

run Application.new