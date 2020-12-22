require 'rubygems'
require 'rest-client'
require 'json'

user = ENV["BROWSERSTACK_USER"]
key = ENV["BROWSERSTACK_ACCESSKEY"]


# API base URL
	base_url = "https://#{user}:#{key}@api.browserstack.com/app-automate/"
	devices = [
		"Google Pixel-8.0", 
		"Google Pixel 3-10.0"
	]



# Upload App
	puts "(1) Uploading App...."
	results = RestClient.post(
		base_url + "upload",
		file: File.new("./app/apps/Espresso-App.apk", 'rb')
	)
	app_url = JSON.parse(results.body)['app_url']




# Upload Tests
	puts "(2) Uploading Test Suite...."
	results = RestClient.post(
		base_url + "espresso/test-suite",
		file: File.new("./app/apps/Espresso-AppTest.apk", 'rb'),
	)
	test_url = JSON.parse(results.body)['test_url']




# Execute Tests
	puts "(3) Launching Build."
	RestClient.post(
		base_url + "espresso/build",
		{ 
			"app": app_url, 
			"testSuite": test_url,
			"devices": devices, 
			"deviceLogs": true 
		}.to_json,
		content_type: :json
	)



