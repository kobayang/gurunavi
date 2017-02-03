require 'simplecov'

module SimpleCov::Configuration
  def clean_filters
    @filters = []
  end
end

SimpleCov.configure do
  clean_filters
  load_profile 'test_frameworks'
end

ENV["COVERAGE"] && SimpleCov.start do
  add_filter "/.rvm/"
end
require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'test/unit'
require 'shoulda'
require 'matchy'
require 'fakeweb'
require 'json'
require 'hashie'
require 'awesome_print'
require 'mocha/setup'

FakeWeb.allow_net_connect = false

def gurunavi_test_client
  Gurunavi::Client.new(keyid: keyid_test)
end

def keyid_test
  "testdayon"
end

def gurunavi_url(url)
  url =~ /^http/ ? url : "https://api.gnavi.co.jp/#{url}"
end

def fixture_file(filename, options={})
  return '' if filename == ''
  file_path = File.expand_path(File.dirname(__FILE__) + '/fixtures/' + filename)
  fixture   = File.read(file_path)

  case File.extname(file_path)
  when '.json'
    options[:parse] ? Hashie::Mash.new(JSON.parse(fixture)) : fixture
  else
    fixture
  end
end

def stub_get(url, filename, options={})
  opts = {
    :body => error_or_body(filename, options),
    :content_type => 'application/json; charset=utf-8'
  }.merge(options)
  FakeWeb.register_uri(:get, gurunavi_url(url), opts)
end

def error_or_body(filename, options={})
  error_options = options.delete(:error)
  gnavi_options = options.delete(:gnavi)
  if error_options
    return fixture_file 'errors/error.json'
  elsif gnavi_options
    return fixture_file 'errors/gnavi_error.json'
  else
    return fixture_file filename
  end
end

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'gurunavi'

class Test::Unit::TestCase
end
