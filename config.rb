# For debugging
require 'pry'

# Assets setup
#
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :partials_dir, 'partials'

# Livereload
#
activate :livereload

# Routing
#
activate :directory_indexes
# redirect "index.html", :to => "en/index.html"
# activate :i18n, :mount_at_root => "en"

# Open Graph Tags
#
# See: https://github.com/ngs/middleman-ogp
#
activate :ogp do |ogp|
  ogp.namespaces = {
    og: data.ogp.og
  }
  ogp.base_url = 'http://credibilitycoalition.org/'
end

# Build config
#
configure :build do
	activate :minify_css
	activate :minify_javascript
  activate :autoprefixer
end

require "json"
$credco_version = JSON.parse(File.read('package.json'))['version']