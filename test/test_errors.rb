require 'helper'

class TestGurunavi < Test::Unit::TestCase
  context "test raise API error with status code" do
    should "raise TooManyAccess error with 429 status code" do
      assert_raises(Gurunavi::TooManyAccess) do
        raise Gurunavi::APIErrorFactory.call_api_errors(429, "")
      end
    end

    should "raise NoShop error with 600 status code" do
      assert_raises(Gurunavi::NoShop) do
        raise Gurunavi::APIErrorFactory.call_api_errors(600, "")
      end
    end

    should "raise InvalidAccess error with 601 status code" do
      assert_raises(Gurunavi::InvalidAccess) do
        raise Gurunavi::APIErrorFactory.call_api_errors(601, "")
      end
    end

    should "raise InvalidShopNumber error with 602 status code" do
      assert_raises(Gurunavi::InvalidShopNumber) do
        raise Gurunavi::APIErrorFactory.call_api_errors(602, "")
      end
    end

    should "raise InvalidType error with 603 status code" do
      assert_raises(Gurunavi::InvalidType) do
        raise Gurunavi::APIErrorFactory.call_api_errors(603, "")
      end
    end

    should "raise InternalServerError error with 603 status code" do
      assert_raises(Gurunavi::InternalServerError) do
        raise Gurunavi::APIErrorFactory.call_api_errors(604, "")
      end
    end

    should "raise APIError error with other status code" do
      assert_raises(Gurunavi::APIError) do
        raise Gurunavi::APIErrorFactory.call_api_errors(1000, "")
      end
    end
  end

  context "When returning a unsucessful response(error)" do
    should "raise Gurunavi::InvalidAccess with error.json status is 601" do
      response = Faraday::Response.new(body: fixture_file('errors/601_error.json', parse: true))
      client   = Gurunavi::Client.new

      assert_raises(Gurunavi::InvalidAccess) do
        client.return_error_or_body(response, response.body)
      end
    end

    should "raise Gurunavi::InvalidAccess with gnavi error json status is 601" do
      response = Faraday::Response.new(body: fixture_file('errors/601_error_gnavi.json', parse: true))
      client   = Gurunavi::Client.new

      assert_raises(Gurunavi::InvalidAccess) do
        client.return_error_or_body(response, response.body)
      end
    end
  end
end
