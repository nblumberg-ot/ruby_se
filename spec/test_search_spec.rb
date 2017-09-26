require 'rubygems'
require 'selenium-webdriver'
require_relative '../browser'
require_relative '../pages/home'
require_relative '../pages/base'
require 'yaml'
require 'rspec'

RSpec.configure do |config|
  config.before(:each) do |test| 
  	@title = test.metadata[:full_description]
  	@driver = Browser.start_session
	@home = Home.new(@driver)
	@base = Base.new(@driver)
	fn = File.expand_path("/Users/nblumberg/ruby_se/data/properties.yml")
	@properties = YAML.load_file(fn)
	@driver.get @properties["base_url"]
  end
  config.after(:each) { 
  	Browser.end_session(@driver, @title)
  }
end

describe "Anonymous search with location suggestion" do

  it "gets to the right page", :cats => true, :slow=> true do
	@home.search("San Francisco")
	title = @base.get_title
	expect(title).to include("Availability")
  end

  it "gets to the wrong page", :cats => true do
	@home.search("San Francisco")
	title = @base.get_title
	expect(title).to include("Availability")
  end

end