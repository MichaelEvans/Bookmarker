# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)

if Rails.env.production?
use Rack::Static, :urls => ["/stylesheets/compiled"], :root => "tmp" #FOR COMPASS
end

run Bookmarker::Application
