require 'rubygems'
require 'selenium-webdriver'
require 'test/unit'
require_relative '../browser'
require_relative '../pages/home'
require_relative '../pages/base'
require 'yaml'

class TestSearch < Test::Unit::TestCase

	def setup
		@test_name = name
		@driver = Browser.start_session
		@home = Home.new(@driver)
		@base = Base.new(@driver)
		fn = File.expand_path(Dir.pwd + "/data/properties.yml")
		@properties = YAML.load_file(fn)
		@driver.get @properties["base_url"]
	end

	def teardown
		Browser.end_session(@driver, method_name)
	end

	def test_anonymous_search_with_location_suggestion_copy
		@home.search("San Francisco")
		title = @base.get_title
		assert_match("Availability", title, message=title + " does not match Availability!")
	end

	def test_anonymous_search_with_location_suggestion_fail_copy
		@home.search("San Francisco")
		title = @base.get_title
		assert_match("Availability", title, message=title + " does not match Availability!")
	end

end
