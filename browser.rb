require 'selenium-webdriver'
# require 'test/unit'

class Browser

	def self.start_session
		# @driver = Selenium::WebDriver.for :chrome
		@driver = Selenium::WebDriver.for(
		:remote,
		url: 'http://mesos-slave12-qa-sf.qasql.opentable.com:31406/wd/hub',
		desired_capabilities: :chrome)
		return @driver
	end

	def self.end_session(driver, method_name)
		driver.save_screenshot(method_name + ".png")
		driver.quit
	end

end