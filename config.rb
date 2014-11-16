require 'slim'

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

configure :build do
end

activate :blog do |blog|
  blog.prefix = "blog"

  blog.layout = "blog_layout"
  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"
  blog.paginate = true
end

page "/feed.xml", :layout => false

activate :s3_sync do |config|
  config.bucket = "acrhodes.com"
end
