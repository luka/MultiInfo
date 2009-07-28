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
api = MultiInfo::API.new(config)

p api.send_message('48661351024', 'Hello')
p api.message_info('22')
p api.cancel_message('22')