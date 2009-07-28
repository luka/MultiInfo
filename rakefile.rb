begin
  require 'jeweler'
  require File.join(File.dirname(__FILE__), *%w[lib/multiinfo/version])

  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "multiinfo"
    gemspec.version = MultiInfo::VERSION.to_s
    gemspec.summary = "Ruby interface to the Polkomtel's MultiInfo SMS gateway service, based on Luke Redpath's clickatel library"
    gemspec.description = "This gem is Ruby interface to the Polkomtel's MultiInfo SMS gateway service, based on Luke Redpath's clickatel library.
    To use this gem, you will need an access to Polkomtel's MultiInfo service. You need user, password, sercvice_id and certificate for ssl connection.
    Contact Polkomtel sales reps for info how to obtain acces to MultiInfo service."
    gemspec.email = "luka@weblify.pl"
    gemspec.homepage = "http://github.com/luka/multiinfo"
    gemspec.authors = ["Łukasz Łuczak"]    
    gemspec.add_dependency('httpclient', '>= 2.0.0')    
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end