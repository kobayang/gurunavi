# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: gurunavi 0.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "gurunavi".freeze
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["kobayang".freeze]
  s.date = "2017-02-03"
  s.description = "A Gurunavi API wrapper of ruby gems".freeze
  s.email = "naokiod@gmail.com".freeze
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "gurunavi.gemspec",
    "lib/gurunavi.rb",
    "lib/gurunavi/api_error.rb",
    "lib/gurunavi/client.rb",
    "lib/gurunavi/master/area_codes.rb",
    "lib/gurunavi/master/areas.rb",
    "lib/gurunavi/master/categories.rb",
    "lib/gurunavi/master/prefs.rb",
    "lib/gurunavi/photos.rb",
    "lib/gurunavi/rests.rb",
    "test/fixtures/area_codes/g_area_large_search.json",
    "test/fixtures/area_codes/g_area_middle_search.json",
    "test/fixtures/area_codes/g_area_small_search.json",
    "test/fixtures/areas/area_search.json",
    "test/fixtures/categories/category_large_search.json",
    "test/fixtures/categories/category_small_search.json",
    "test/fixtures/errors/error.json",
    "test/fixtures/errors/error_gnavi.json",
    "test/fixtures/photos/photo_search.json",
    "test/fixtures/prefs/pref_search.json",
    "test/fixtures/rests/foreign_rest_search.json",
    "test/fixtures/rests/rest_search.json",
    "test/helper.rb",
    "test/test_area_codes.rb",
    "test/test_areas.rb",
    "test/test_categories.rb",
    "test/test_client.rb",
    "test/test_photos.rb",
    "test/test_prefs.rb",
    "test/test_rests.rb"
  ]
  s.homepage = "http://github.com/kobayang/gurunavi".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.5.2".freeze
  s.summary = "A Gurunavi API wrapper of ruby gems".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<faraday>.freeze, ["~> 0.8"])
      s.add_runtime_dependency(%q<faraday_middleware>.freeze, [">= 0.8"])
      s.add_runtime_dependency(%q<hashie>.freeze, ["< 4.0.0", ">= 0.8"])
      s.add_development_dependency(%q<test-unit>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<shoulda>.freeze, [">= 0"])
      s.add_development_dependency(%q<rdoc>.freeze, ["~> 3.12"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.0"])
      s.add_development_dependency(%q<jeweler>.freeze, ["~> 2.3.3"])
      s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.13.0"])
      s.add_development_dependency(%q<jnunemaker-matchy>.freeze, [">= 0.0"])
      s.add_development_dependency(%q<fakeweb>.freeze, ["~> 1.3"])
      s.add_development_dependency(%q<awesome_print>.freeze, [">= 0"])
      s.add_development_dependency(%q<mocha>.freeze, [">= 0"])
    else
      s.add_dependency(%q<faraday>.freeze, ["~> 0.8"])
      s.add_dependency(%q<faraday_middleware>.freeze, [">= 0.8"])
      s.add_dependency(%q<hashie>.freeze, ["< 4.0.0", ">= 0.8"])
      s.add_dependency(%q<test-unit>.freeze, ["~> 3.0"])
      s.add_dependency(%q<shoulda>.freeze, [">= 0"])
      s.add_dependency(%q<rdoc>.freeze, ["~> 3.12"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.0"])
      s.add_dependency(%q<jeweler>.freeze, ["~> 2.3.3"])
      s.add_dependency(%q<simplecov>.freeze, ["~> 0.13.0"])
      s.add_dependency(%q<jnunemaker-matchy>.freeze, [">= 0.0"])
      s.add_dependency(%q<fakeweb>.freeze, ["~> 1.3"])
      s.add_dependency(%q<awesome_print>.freeze, [">= 0"])
      s.add_dependency(%q<mocha>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<faraday>.freeze, ["~> 0.8"])
    s.add_dependency(%q<faraday_middleware>.freeze, [">= 0.8"])
    s.add_dependency(%q<hashie>.freeze, ["< 4.0.0", ">= 0.8"])
    s.add_dependency(%q<test-unit>.freeze, ["~> 3.0"])
    s.add_dependency(%q<shoulda>.freeze, [">= 0"])
    s.add_dependency(%q<rdoc>.freeze, ["~> 3.12"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.0"])
    s.add_dependency(%q<jeweler>.freeze, ["~> 2.3.3"])
    s.add_dependency(%q<simplecov>.freeze, ["~> 0.13.0"])
    s.add_dependency(%q<jnunemaker-matchy>.freeze, [">= 0.0"])
    s.add_dependency(%q<fakeweb>.freeze, ["~> 1.3"])
    s.add_dependency(%q<awesome_print>.freeze, [">= 0"])
    s.add_dependency(%q<mocha>.freeze, [">= 0"])
  end
end

