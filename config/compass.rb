project_type = :rails
project_path = Compass::AppIntegration::Rails.root

http_path = "/"

environment = Compass::AppIntegration::Rails.env
if environment == 'production'
  css_dir = "tmp/stylesheets"
  sass_dir = "app/views/stylesheets"
else
  css_dir = "public/stylesheets"
  sass_dir = "app/stylesheets"
end