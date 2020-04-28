CarrierWave.configure do |config|
 config.cache_storage = :file

 if ENV["ASSET_HOST"]
   config.asset_host = ENV["ASSET_HOST"]
 end
end
