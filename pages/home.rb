require 'selenium-webdriver'

class Home

	def initialize(driver)
		@driver = driver
	end

	def search(search_text)
		initial_search_box = @driver.find_element :css => ".dtp-picker-search.tt-input"
		for i in 0..3
			begin
				initial_search_box.click
				engaged_search_area = @driver.find_element :css => ".dtp-picker-search-container.highlighted"
				initial_search_box.attribute("placeholder").length > 1
				break
			rescue
				sleep 1
			end
		end
		search_box = @driver.find_element :name => "searchText"
		search_box.send_keys search_text
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

end