require 'rubygems'
require 'selenium-webdriver'
require 'test/unit'
require_relative '../pages/home'
require_relative '../pages/base'
require 'yaml'

class TestSearchCopyTwo < Test::Unit::TestCase

	def setup
		#@driver = Selenium::WebDriver.for :firefox
 		@driver = Selenium::WebDriver.for(
		:remote,
		url: 'http://localhost:32768/wd/hub',
		desired_capabilities: :firefox)
		@home = Home.new(@driver)
		@base = Base.new(@driver)
		fn = File.expand_path(Dir.pwd + "/data/properties.yml")
		@properties = YAML.load_file(fn)
		@driver.get @properties["base_url"]
	end

	def teardown
		@driver.quit
	end

	def test_anonymous_search_with_location_suggestion_three
		@home.search("San Francisco")
		title = @base.get_title
		assert_match "Availability", title
	end

	def test_anonymous_search_with_location_suggestion_fail_three
		@home.search("San Francisco")
		title = @base.get_title
		assert_match "Availability!", title
	end

end