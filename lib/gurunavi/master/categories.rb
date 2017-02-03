module Gurunavi
  module Categories

    # Ref: http://api.gnavi.co.jp/api/manual/categorylmaster/
    def category_large_search(options={})
      response = connection.get do |req|
        req.url "master/CategoryLargeSearchAPI/#{@api_version}", options
      end
      return_error_or_body(response, response.body.category_l)
    end

    # Ref: http://api.gnavi.co.jp/api/manual/categorysmaster/
    def category_small_search(options={})
      response = connection.get do |req|
        req.url "master/CategorySmallSearchAPI/#{@api_version}", options
      end
      return_error_or_body(response, response.body.category_s)
    end

  end
end