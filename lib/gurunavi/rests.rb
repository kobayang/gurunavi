module Gurunavi
  module Rests

    # Ref: http://api.gnavi.co.jp/api/manual/restsearch/
    def rest_search(options={})
      response = connection.get do |req|
        req.url "RestSearchAPI/#{@api_version}", options
      end
      return_error_or_body(response, response.body.rest)
    end

    # Ref: http://api.gnavi.co.jp/api/manual/foreignrestsearch/
    def foreign_rest_search(options={})
      response = connection.get do |req|
        req.url "ForeignRestSearchAPI/#{@api_version}", options
      end
      return_error_or_body(response, response.body.rest)
    end

  end
end
