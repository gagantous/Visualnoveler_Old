Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    # Choose a test framework:
    with.test_framework :rspec

    # Choose one or more libraries:
    # Or, choose the following (which implies all of the above):
    with.library :rails
  end
end