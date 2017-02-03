module Gurunavi
  module Areas

    # Ref: http://api.gnavi.co.jp/api/manual/areamaster/
    def area_search(options={})
      response = connection.get do |req|
        req.url "master/AreaSearchAPI/#{@api_version}", options
      end
      return_error_or_body(response, response.body.area)
    end

  end
end