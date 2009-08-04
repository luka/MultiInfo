module MultiInfo end

%w( core-ext/hash
    core-ext/string
    multiinfo/api     
).each do |lib|
    require File.join(File.dirname(__FILE__), lib)
end

# MultiInfo::API.test_mode = true
# MultiInfo::API.debug_mode = true
config = MultiInfo::API.load_auth_options

# MultiInfo::API.test_mode = true
# MultiInfo::API.debug_mode = true
api = MultiInfo::API.new(config)

# p api.send_message('48601711377', 'Hello from MultiInfo!')
p api.cancel_message('29066226')
