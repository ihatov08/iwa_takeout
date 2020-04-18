if defined?(Capybara)
  if ENV["CAPYBARA_DRIVER"] == "headless_chrome"
    Capybara.register_driver :headless_chrome do |app|
      Capybara::Selenium::Driver.new(app,
        browser: :chrome,
        options: Selenium::WebDriver::Chrome::Options.new(
          args: %w(--headless --disable-gpu --lang=ja-JP)
        )
      )
    end
  else
    Capybara.javascript_driver = :selenium
    Capybara.run_server = false
    Capybara.default_driver = :selenium
    args = ['window-size=1440,990']
    caps = Selenium::WebDriver::Remote::Capabilities.chrome(
      "chromeOptions" => {
        'prefs' => {
          'intl.accept_languages' => 'ja-JP'
        },
        "args" => args,
        })
    Capybara.register_driver :selenium do |app|
      Capybara::Selenium::Driver.new(
          app,
          browser: :remote,
          url: "http://#{ENV.fetch('SELENIUM_HOST')}:#{ENV.fetch('SELENIUM_PORT')}/wd/hub",
          desired_capabilities: caps
      )
    end
  end
end
