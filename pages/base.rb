require 'selenium-webdriver'

class Base

	def initialize(driver)
		@driver = driver
	end

	def get_title
		title = @driver.title
		return title
	end

end