require "test_helper"

class AppendixTest < Stix2::Test
  def test_appendix
    4.times do |i|
      stix_messages("appendix_c_#{i + 1}").each do |message|
        assert Stix2.parse(message)
      end
    end
  end
end
