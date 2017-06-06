Before do
  @profile = Selenium::WebDriver::Firefox::Profile.new
  @profile['reader.parse-on-load.enabled'] = false

  @driver = Selenium::WebDriver.for :firefox, :profile => @profile, :desired_capabilities => {:marionette => false}
  @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
end

After do
  @driver.quit
end