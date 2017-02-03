require 'helper'

class TestGurunavi < Test::Unit::TestCase
  context "Confirm Gurunavi helper methods" do
    setup do
      @client = gurunavi_test_client
    end

    should "client has keyid" do
      @client.keyid.should == keyid_test
    end
  end

  context "When returning a unsucessful response(error)" do
    should "raise Gurunavi::Error with error.json" do
      response = Faraday::Response.new(body: fixture_file('errors/error.json', parse: true))
      client   = Gurunavi::Client.new

      assert_raises(Gurunavi::APIError) do
        client.return_error_or_body(response, response.body)
      end
    end

    should "raise Gurunavi::Error with gnavi error json" do
      response = Faraday::Response.new(body: fixture_file('errors/error_gnavi.json', parse: true))
      client   = Gurunavi::Client.new

      assert_raises(Gurunavi::APIError) do
        client.return_error_or_body(response, response.body)
      end
    end
  end
end
