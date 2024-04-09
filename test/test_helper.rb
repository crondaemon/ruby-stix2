require "simplecov"
SimpleCov.start

require "minitest/autorun"
require "stix2"

module Stix2
  class Test < Minitest::Test
    private

    def stix_messages(type)
      JSON.parse(File.read("test/fixtures/#{type}.json"))
    end
  end
end
