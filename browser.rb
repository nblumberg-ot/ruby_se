require 'selenium-webdriver'
require 'fileutils'

class Browser

	def self.start_session
		# @driver = Selenium::WebDriver.for :chrome

		@driver = Selenium::WebDriver.for(
		:remote,
		url: 'http://mesos-slave9-qa-sf.qasql.opentable.com:31135/wd/hub',
		desired_capabilities: :chrome)

		return @driver
	end

	def self.save_screenshot(driver, method_name)
		driver.save_screenshot(method_name + ".png")
	end

	def self.end_session(driver)
		driver.quit
	end

	def self.add_images_to_report

		report_file = "report_" + ENV['TEST_ENV_NUMBER'] +".html"
		images = Dir["*.png"]
		tempfile=File.open(report_file + ".tmp", 'w')
		f=File.new(report_file)

		f.each do |line|
		  	tempfile<<line unless line.include? "Install the coderay gem to get syntax highlighting"
		  	images.each do |image|
		    	if line.include? image.split.last(6).join(" ").split(".").first

		      		tempfile << '<br><span class="embed">
		      		<a href="" onclick="img=document.getElementById(\'img_0\'); img.style.display = (img.style.display == \'none\' ? \'block\' : \'none\');return false">Here is a screenshot.</a>
		      		<br>&nbsp;
              		<img id="img_0" style="display: none" src="' + image + '"/></span>'

		    	end
		  	end
		end

		tempfile << "</dl></div></div></div></body></html>"

		f.close
		tempfile.close
		FileUtils.mv(report_file + ".tmp", report_file)
		
	end
end