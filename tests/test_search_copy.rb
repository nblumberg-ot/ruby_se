require 'rubygems'
require 'selenium-webdriver'
require 'test/unit'
require_relative '../pages/home'
require_relative '../pages/base'
require 'yaml'

class Search < Test::Unit::TestCase

	def setup
		@driver = Selenium::WebDriver.for :firefox
		@wait = Selenium::WebDriver::Wait.new(:timeout => 10)
		@home = Home.new(@driver)
		@base = Base.new(@driver)
		fn = File.expand_path(Dir.pwd + "/data/properties.yml")
		@properties = YAML.load_file(fn)
		@driver.get @properties["base_url"]
	end

	def teardown
		@driver.quit
	end

	def test_anonymous_search_with_location_suggestion_copy
		@home.search("San Francisco")
		title = @base.get_title
		assert_match "Availability", title
	end

	def test_anonymous_search_with_location_suggestion_fail_copy
		@home.search("San Francisco")
		title = @base.get_title
		assert_match "Availability!", title
	end

end