###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
activate :livereload

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'


# foundation patch per http://wanderwort.de/2013/04/11/using-zurb-foundation-with-middleman/
bourbon_path = Gem::Specification.find_by_name('bourbon').gem_dir
set :js_assets_paths, [File.join(root, 'bower_components')]
set :sass_assets_paths, [File.join(root, 'bower_components/foundation/scss'), File.join(bourbon_path, 'app/assets/stylesheets')]


# pretty urls, as directories
activate :directory_indexes

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # uncomment below to activate colosure compiler, causing issues with clearing
  set :js_compressor, ::Closure::Compiler.new


  # set :js_compressor, ::Closure::Compiler.new(:compilation_level => 'ADVANCED_OPTIMIZATIONS')
  # set :js_compressor, ::Closure::Compiler.new(:compilation_level => 'ADVANCED_OPTIMIZATIONS', :externs => "source/javascripts/vendor/jquery.externs.js")

  # gzip content for CloudFront / s3
  activate :gzip

  # Enable cache buster
  activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_path, "/Content/images/"

  # activate :imageoptim do |imageoptim|
  #   # print out skipped images
  #   imageoptim.verbose = true

  #   # Setting these to true or nil will let imageoptim determine them (recommended)
  #   imageoptim.nice = true
  #   imageoptim.threads = true

  #   # Image extensions to attempt to compress
  #   imageoptim.image_extensions = %w(.png .jpg .gif)

  #   # compressor worker options, individual optimisers can be disabled by passing
  #   # false instead of a hash
  #   # imageoptim.pngcrush_options  = {:chunks => ['alla'], :fix => false, :brute => false}
  #   # imageoptim.optipng_options   = {:level => 6, :interlace => false}
  #   # imageoptim.advpng_options    = {:level => 4}
  #   imageoptim.jpegoptim_options = {:strip => ['all'], :max_quality => 80}
  #   # imageoptim.jpegtran_options  = {:copy_chunks => false, :progressive => true, :jpegrescan => true}
  #   # imageoptim.gifsicle_options  = {:interlace => false}
  # end


end

