require 'selenium-webdriver'

class Base

	def initialize(driver)
		@driver = driver
		@wait = Selenium::WebDriver::Wait.new(:timeout => 10)
	end

	def get_element(css_selector)
		element = @driver.find_element :css => css_selector
		return element
	end

	def get_title
		title = @driver.title
		return title
	end

	def click_until_attribute_null(click_element, attribute, wait_time=1, tries=5)
		for i in 0..tries
			begin
				click_element_object = @driver.find_element :css => click_element
				click_element_object.click
				click_element.attribute(attribute).length > 1
				break
			rescue
				sleep wait_time
			end
		end
	end

	def click_until_successful(click_element, wait_time=1, tries=5)
		for i in 0..tries
			begin
				first_location_suggestion = @driver.find_element :css => click_element
				first_location_suggestion.click
			rescue
				sleep wait_time
			end
		end
	end

	def wait_until_text_in_page_source(text, wait_time=1, tries=5)
		for i in 0..tries
			source = @driver.page_source
			if source.include? text
				break
			else
				sleep wait_time
			end
		end
	end

	def wait_until_text_not_in_page_source(text, wait_time=1, tries=5)
		for i in 0..tries

			source = @driver.page_source
			if !source.include? text
				break
			else
				sleep wait_time
			end
		end
	end
end