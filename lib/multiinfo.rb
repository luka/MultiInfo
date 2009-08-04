module MultiInfo end

%w( core-ext/hash
    core-ext/string
    multiinfo/api     
).each do |lib|
    require File.join(File.dirname(__FILE__), lib)
end