require 'rubygems'
require 'selenium-webdriver'
require 'test-unit'
require 'browserstack/local'
require 'rest-client'

class ParallelTest < Test::Unit::TestCase

  def setup
  	caps = Selenium::WebDriver::Remote::Capabilities.new
		caps["browser"] = ENV['browser']
		caps["browser_version"] = ENV['browser_version']
		caps["os"] = ENV['os']
		caps["os_version"] = ENV['os_version']

		if ENV['browser'] != "Internet Explorer"
			browser_name = "#{ENV['browser'].capitalize} #{ENV['browser_version']}"
		else
			browser_name = "Internet Explorer #{ENV['browser_version']}"
		end

		caps['project'] = "BrowserStack desktop cron"
		caps['build'] = ENV['build_name']
		caps['name'] = "Parallel Test: " + browser_name

		caps["browserstack.debug"] = "true"

    url = "http://#{ENV["BROWSERSTACK_USER"]}:#{ENV["BROWSERSTACK_ACCESSKEY"]}@hub-cloud.browserstack.com/wd/hub"
    @driver = Selenium::WebDriver.for(:remote, :url => url, :desired_capabilities => caps)
  end

  def test_post_success_1
		@driver.navigate.to 'http://www.browserstack.com'
	  	sleep 10
		title = @driver.title
    assert_equal(title, title)
  end
	
  def test_post_success_2
		@driver.navigate.to 'http://www.browserstack.com'
	  	sleep 10
		title = @driver.title
    assert_equal(title, title)
  end

#   def test_post_fail
# 		@driver.navigate.to 'http://www.browserstack.com'
# 	  	sleep 10
# 		title = @driver.title
#     assert_equal(title, 'wrong title')
#   end

  def teardown
  	api_url = "https://#{ENV["BROWSERSTACK_USER"]}:#{ENV["BROWSERSTACK_ACCESSKEY"]}@www.browserstack.com/automate/sessions/#{@driver.session_id}.json"
  	if self.passed?
  		RestClient.put api_url, {"status"=>"passed"}, {:content_type => :json}
  	else
  		RestClient.put api_url, {"status"=>"failed"}, {:content_type => :json}
  	end
    @driver.quit
  end
  
end
