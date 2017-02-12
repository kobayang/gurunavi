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
end
