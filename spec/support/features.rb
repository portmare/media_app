# /spec/support/features.rb
RSpec.configure do |config|
  config.include Features::SessionHelpers, type: :feature
  config.include Features::AlbumHelpers, type: :feature
  config.include Features::ImageHelpers, type: :feature
end