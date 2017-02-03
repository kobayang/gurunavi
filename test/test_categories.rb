require 'helper'

class TestGurunavi < Test::Unit::TestCase
  context "When using the CategorySearchAPI" do
    setup do
      @client = gurunavi_test_client
    end

    should "fetch results when searching from category large search api" do
      stub_get("https://api.gnavi.co.jp/master/CategoryLargeSearchAPI/20150630?format=json&keyid=#{@client.keyid}", "categories/category_large_search.json")
      categories = @client.category_large_search

      assert_not_nil(categories)
    end

    should "fetch results when searching from category small search api" do
      stub_get("https://api.gnavi.co.jp/master/CategorySmallSearchAPI/20150630?format=json&keyid=#{@client.keyid}", "categories/category_small_search.json")
      categories = @client.category_small_search

      assert_not_nil(categories)
    end

  end
end
