require 'html-proofer'
require 'rainbow'

# Banner helper
#
def text_banner(text = "")
  puts Rainbow("==========================================================").yellow
  puts Rainbow(text).yellow
  puts Rainbow("==========================================================").yellow
end

if RUBY_PLATFORM == "x86_64-darwin16"
  puts "Configuring Slimer for Mac... "
  system "export SLIMERJSLAUNCHER='/Applications/Firefox.app/Contents/MacOS/firefox'"
else
  puts "WARNING: Make sure you set SLIMERJSLAUNCHER to your Firefox path..."
end

# Start the server
#
text_banner("Starting server...")
system 'node server.js &'

# Run HTML Proofer to check for broken links
#
text_banner("Starting HTML Proofer tests...")
HTMLProofer.check_directory("./build", {
  :verbose => true,
  :check_html => true,
  # :check_opengraph => true,
  :only_4xx => true
  }).run

# Check for accessibility issues
#
text_banner("Starting accessibility tests...")
system 'a11y ./build/**/*.html' or raise "Accessibility tests failed!"
