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

    should "fetch results when searching from foeign rest search api with hit_per_page options" do
      stub_get("https://api.gnavi.co.jp/ForeignRestSearchAPI/20150630?format=json&hit_per_page=10&keyid=#{@client.keyid}", "rests/foreign_rest_search.json")
      rests = @client.foreign_rest_search(hit_per_page: 10)

      rests.count.should == 10
    end

  end
end
