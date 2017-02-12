require 'helper'

class TestGurunavi < Test::Unit::TestCase
  context "When using the PhotoSearchAPI" do
    setup do
      @client = gurunavi_test_client
    end

    should "fetch results when searching from photo search api with no options" do
      stub_get("https://api.gnavi.co.jp/PhotoSearchAPI/20150630?format=json&id=ga13300&keyid=#{@client.keyid}", "photos/photo_search.json")
      photos = @client.photo_search(id: "ga13300")

      assert_not_nil(photos)

      photos.count.should == 2

      photos[0].vote_id.should == "1855607"
    end

  end
end
