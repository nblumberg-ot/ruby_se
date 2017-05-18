require 'selenium-webdriver'
require_relative 'base'

class Home < Base

	def initialize(driver)
		@driver = driver
		@wait = Selenium::WebDriver::Wait.new(:timeout => 10)

		@initial_search_box = ".dtp-picker-search.tt-input"
		@engaged_search_area = ".dtp-picker-search-container.highlighted"
		@search_box = "[name='searchText']"
		@first_location_suggestion = ".tt-suggestion"
		@find_table_button = ".dtp-picker-button"
		@searching_text = "OpenTable is connecting to restaurants and searching their computer reservation systems to find tables for you."
		@placeholder_attribute = "placeholder"

	end

	def search(search_text)
		
		click_until_attribute_null(@initial_search_box, @placeholder_attribute)
		get_element(@search_box).send_keys search_text
		click_until_successful(@first_location_suggestion)
		get_element(@find_table_button).click
		wait_until_text_in_page_source(@searching_text)
		wait_until_text_not_in_page_source(@searching_text)

	end

end