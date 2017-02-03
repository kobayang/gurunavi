require 'helper'

class TestGurunavi < Test::Unit::TestCase
  context "When using the AreaSearchAPI" do
    setup do
      @client = gurunavi_test_client
    end

    should "fetch results when searching from area large code search api" do
      stub_get(
        "https://api.gnavi.co.jp/master/GAreaLargeSearchAPI/20150630?format=json&keyid=#{@client.keyid}",
        "area_codes/g_area_large_search.json")
      area_codes = @client.g_area_large_search

      assert_not_nil(area_codes)
    end

    should "fetch results when searching from area middle code search api" do
      stub_get(
        "https://api.gnavi.co.jp/master/GAreaMiddleSearchAPI/20150630?format=json&keyid=#{@client.keyid}",
        "area_codes/g_area_middle_search.json")
      area_codes = @client.g_area_middle_search

      assert_not_nil(area_codes)
    end

    should "fetch results when searching from area small code search api" do
      stub_get(
        "https://api.gnavi.co.jp/master/GAreaSmallSearchAPI/20150630?format=json&keyid=#{@client.keyid}",
        "area_codes/g_area_small_search.json")
      area_codes = @client.g_area_small_search

      assert_not_nil(area_codes)
    end

  end
end
