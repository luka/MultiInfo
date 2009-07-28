# -*- encoding: utf-8 -*-
require File.join(File.dirname(__FILE__), *%w[lib/multiinfo/version])

$gemspec = Gem::Specification.new do |s|
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  
  s.name                = %q{multiinfo}
  s.version             = MultiInfo::VERSION.to_s
  s.summary             = "Ruby interface to the Polkomtel's MultiInfo SMS gateway service, based on Luke Redpath's clickatel library"
  s.author              = "Łukasz Łuczak"
  s.email               = "luka@weblify.pl"
  s.homepage            = "http://.github.com"
  s.date                = %q{2009-07-27}
  s.extra_rdoc_files    = ["RDOC_README.txt", "History.txt", "License.txt"]
  s.files               = ["History.txt", "License.txt", "RDOC_README.txt", "README.txt", "lib/multiinfo", "lib/multiinfo/api", "lib/multiinfo/api/command.rb", "lib/multiinfo/api/error.rb", "lib/multiinfo/api/executor.rb", "lib/multiinfo/api/response.rb", "lib/multiinfo/api.rb", "lib/multiinfo/version.rb", "lib/multiinfo.rb", "lib/core-ext", "lib/core-ext/hash.rb", "lib/core-ext/string.rb"]
  s.has_rdoc            = true
  s.rdoc_options        = ["--main", "RDOC_README.txt"]
  s.require_paths       = ["lib"]
  s.rubyforge_project   = %q{multiinfo}
  s.rubygems_version    = %q{1.3.1}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 0"])
  end
end
