require 'selenium/webdriver'
require 'capybara'
require 'capybara/dsl'

class Capybara::Selenium::Driver < Capybara::Driver::Base
  def quit
  end
end

Capybara.register_driver :selenium do |app|
  # https://gist.github.com/mars/6957187
  Capybara::Selenium::Driver.new(app,
                                 browser: :chrome,
                                 desired_capabilities: {
                                   "chromeOptions" => {
                                     "args" => %w{ window-size=1280,960 }
                                   }
                                 }
                                )
end

Capybara.default_driver = :selenium
Capybara.run_server = false

include Capybara::DSL

visit 'http://s.codepen.io/kyanny/debug/jrYaOr'
p has_css?('[data-item="1"]')
p has_content?('Large window size')
