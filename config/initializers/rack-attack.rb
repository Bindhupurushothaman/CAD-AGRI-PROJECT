class Rack::Attack  # your custom configuration...
Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new # defaults to Rails.cache

Rack::Attack.safelist('allow from localhost') do |req|
  # Requests are allowed if the return value is truthy
  '127.0.0.1' == req.ip || '::1' == req.ip
end

Rack::Attack.throttle('logins/email', limit: 5, period: 60.seconds) do |req|
  req.params['email'] if req.path == '/login' && req.post?
end

end

