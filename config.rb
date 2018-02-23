# Assets setup
#
set :css_dir, 'css'
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

  # For github pages staging site, without a proper domain
  # Remove this line when switching to stating url not in subdir
  # CGB 2018-2-22
  set :http_prefix, 'credibilitycoalition.org/'
end