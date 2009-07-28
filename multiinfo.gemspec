# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{multiinfo}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Josh Nichols"]
  s.date = %q{2009-07-28}
  s.description = %q{This gem is Ruby interface to the Polkomtel's MultiInfo SMS gateway service, based on Luke Redpath's clickatel library. To use this gem, you will need an access to Polkomtel's MultiInfo service. You need user, password, sercvice_id and certificate for ssl connection. Contact Polkomtel sales reps for info how to obtain acces to MultiInfo service.}
  s.email = %q{luka@weblify.pl}
  s.extra_rdoc_files = [
    "README.txt"
  ]
  s.files = [
    ".gitignore",
     "History.txt",
     "License.txt",
     "RDOC_README.txt",
     "README.txt",
     "VERSION",
     "config_example.yml",
     "lib/core-ext/hash.rb",
     "lib/core-ext/string.rb",
     "lib/multiinfo.rb",
     "lib/multiinfo/api.rb",
     "lib/multiinfo/api/command.rb",
     "lib/multiinfo/api/error.rb",
     "lib/multiinfo/api/executor.rb",
     "lib/multiinfo/api/response.rb",
     "lib/multiinfo/version.rb",
     "multiinfo.gemspec"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/luka/multiinfo}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Ruby interface to the Polkomtel's MultiInfo SMS gateway service, based on Luke Redpath's clickatel library}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
