require 'helper'

class TestGurunavi < Test::Unit::TestCase
  context "When using the PrefSearchAPI" do
    setup do
      @client = gurunavi_test_client
    end

    should "fetch results when searching from pref search api" do
      stub_get("https://api.gnavi.co.jp/master/PrefSearchAPI/20150630?format=json&keyid=#{@client.keyid}", "prefs/pref_search.json")
      prefs = @client.pref_search

      assert_not_nil(prefs)

      prefs.count.should == 47
    end

  end
end
