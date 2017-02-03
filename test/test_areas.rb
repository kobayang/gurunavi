require 'helper'

class TestGurunavi < Test::Unit::TestCase
  context "When using the AreaSearchAPI" do
    setup do
      @client = gurunavi_test_client
    end

    should "fetch results when searching from area search api" do
      stub_get("https://api.gnavi.co.jp/master/AreaSearchAPI/20150630?format=json&keyid=#{@client.keyid}", "areas/area_search.json")
      areas = @client.area_search

      assert_not_nil(areas)

      areas[0].area_code.should == "AREA150"
      areas[0].area_name.should == "北海道"
    end

  end
end
