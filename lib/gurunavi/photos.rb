module Gurunavi
  module Photos

    # Ref: http://api.gnavi.co.jp/api/manual/photosearch/
    def photo_search(options={})
      response = connection.get do |req|
        req.url "PhotoSearchAPI/#{@api_version}", options
      end
      return_error_or_body(response, response.body.response)
    end

  end
end