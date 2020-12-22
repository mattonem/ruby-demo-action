# Demo - Ruby

This repo contains a working demo for the following BrowserStack products written in Ruby:

1. Automate
2. App Automate

Installation Instructions
------------

1. Clone the repo to your machine
2. Add your credentials to the config.yml file like so:
```
BROWSERSTACK_USER: username
BROWSERSTACK_ACCESSKEY: accesskey
```
3. Add the following app files in the `app/apps` directory:
- [Calculator.apk](https://www.browserstack.com/app-automate/sample-apps/android/Calculator.apk)
- [CalculatorTest.apk](https://www.browserstack.com/app-automate/sample-apps/android/CalculatorTest.apk)
- [WikipediaSample.apk](https://www.browserstack.com/app-automate/sample-apps/android/WikipediaSample.apk)
- [BrowserStack-SampleApp.ipa](https://www.browserstack.com/app-automate/sample-apps/ios/BrowserStack-SampleApp.ipa)
- [BrowserStack-SampleXCUITest.zip](https://www.browserstack.com/app-automate/sample-apps/ios/BrowserStack-SampleXCUITest.zip)

Usage Instructions
---

### Running a localhost server
From the root directory, run the python command `python -m HTTPSimpleServer 8000`

### Running Automate tests
Run Automate tests using these commands:
|Type of Test|Command|Notes|
|------------|-------|-----|
|Single Selenium Test|`rake single`|
|Parallel Desktop Browsers|`rake parallel`|This uses the browser list in `web/browsers/browsers.json`|
|Parallel Mobile Browsers|`rake mobile`|This uses the device list in `web/browsers/devices.json`|
|Test with Local Testing Enabled|`rake local`|This uses Local Testing bindings and requires a local server tunning at `localhost:8000`|
|Mark failing test with REST API|`rake fail`|

### Running App Automate tests
Run App Automate tests using these commands:
|Type of Test|Command|Notes|
|------------|-------|-----|
|Appium|`rake appium`|The rake task checks if a demo app has been uploaded and automatically uploads the WikipediaSample app if not|
|Espresso|`rake espresso`|The script uploads the Calculator and CalculatorTest files, then executes tests via API|
|XCUITest|`rake xcuitest`|The script uploads the BrowserStack-SampleApp and BrowserStack-SampleXCUITest files,  then executes tests via API|
