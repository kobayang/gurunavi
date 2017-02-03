module Gurunavi
  module AreaCodes

    # Ref: http://api.gnavi.co.jp/api/manual/arealmaster/
    def g_area_large_search(options={})
      response = connection.get do |req|
        req.url "master/GAreaLargeSearchAPI/#{@api_version}", options
      end
      return_error_or_body(response, response.body.garea_large)
    end

    # Ref: http://api.gnavi.co.jp/api/manual/areammaster/
    def g_area_middle_search(options={})
      response = connection.get do |req|
        req.url "master/GAreaMiddleSearchAPI/#{@api_version}", options
      end
      return_error_or_body(response, response.body.garea_middle)
    end

    # Ref: http://api.gnavi.co.jp/api/manual/areasmaster/
    def g_area_small_search(options={})
      response = connection.get do |req|
        req.url "master/GAreaSmallSearchAPI/#{@api_version}", options
      end
      return_error_or_body(response, response.body.garea_small)
    end


  end
end