require 'helper'

class TestGurunavi < Test::Unit::TestCase
  context "When using the RestSearchAPI" do
    setup do
      @client = gurunavi_test_client
    end

    should "fetch results when searching from rest search api with hit_per_page options" do
      stub_get("https://api.gnavi.co.jp/RestSearchAPI/20150630?format=json&hit_per_page=10&keyid=#{@client.keyid}", "rests/rest_search.json")
      rests = @client.rest_search(hit_per_page: 10)

      rests.count.should == 10
    end

    should "fetch results type is HashieArray when searching from rest search api with one hit case" do
      stub_get("https://api.gnavi.co.jp/RestSearchAPI/20150630?format=json&keyid=#{@client.keyid}", "rests/rest_search_one_hit_case.json")
      rests = @client.rest_search

      rests.count.should == 1
      rests.each do |rest|
        rest.id.should == "5213224"
      end
    end

    should "fetch results when searching from foeign rest search api with hit_per_page options" do
      stub_get("https://api.gnavi.co.jp/ForeignRestSearchAPI/20150630?format=json&hit_per_page=10&keyid=#{@client.keyid}", "rests/foreign_rest_search.json")
      rests = @client.foreign_rest_search(hit_per_page: 10)

      rests.count.should == 10
    end

    should "raise Gurunavi::InvalidAccess with error.json status is 601" do
      stub_get("https://api.gnavi.co.jp/RestSearchAPI/20150630?format=json&keyid=#{@client.keyid}", "errors/601_error.json")

      assert_raises(Gurunavi::InvalidAccess) do
        @client.rest_search
      end
    end

    should "raise Gurunavi::NoShop with error.json status is 600" do
      stub_get("https://api.gnavi.co.jp/RestSearchAPI/20150630?format=json&keyid=#{@client.keyid}", "errors/600_error.json")

      assert_raises(Gurunavi::NoShop) do
        @client.rest_search
      end
    end

  end
end
