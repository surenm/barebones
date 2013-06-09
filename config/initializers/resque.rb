ENV["REDISTOGO_URL"] ||= "redis://localhost:6379"

uri = URI.parse(ENV["REDISTOGO_URL"])
Resque.redis = Redis.new :host => uri.host, :port => uri.port, :password => uri.password

unless Rails.application.config.cache_classes
  Resque.after_fork do |job|
    ActionDispatch::Reloader.cleanup!
    ActionDispatch::Reloader.prepare!
  end
end