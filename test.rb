require 'rubygems'
require 'selenium-webdriver'
require 'test/unit'


class Fun < Test::Unit::TestCase

	def setup
		@driver = Selenium::WebDriver.for :firefox
		@wait = Selenium::WebDriver::Wait.new(:timeout => 10)
		@driver.get "http://www.opentable.com"
	end

	def teardown
		@driver.quit
	end

	def search
		initial_search_box = @driver.find_element :id => "dtp-search-single-box"
		initial_search_box.click
		search_box = @driver.find_element :name => "searchText"
		search_box.send_keys "San Francisco"
		for i in 0..3
			begin
				first_location_suggestion = @driver.find_element :class => "tt-suggestion"
				first_location_suggestion.click
			rescue
				sleep 1
			end
		end
		find_table_button = @driver.find_element :class => "dtp-picker-button"
		find_table_button.click
	end

	def get_changed_title
		title = @driver.title
		return title
	end

	def test_anonymous_search_with_location_suggestion
		search
		title = get_changed_title
		assert_match "Availability", title
	end

	def test_anonymous_search_with_location_suggestion_fail
		search
		title = get_changed_title
		assert_match "Availability!", title
	end

end