# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
Rails.application.config.assets.precompile << proc do |path|
  true if path =~ /\.(eot|svg|ttf|woff|png)\z/
end
