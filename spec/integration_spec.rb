ENV['RACK_ENV'] = 'test'

require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

RSpec.configure do |config|
  config.after(:each) do
    Subject.all().each() do |subject|
      subject.destroy()
    end
  end
end
