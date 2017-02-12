module Gurunavi
  module Photos

    # Ref: http://api.gnavi.co.jp/api/manual/photosearch/
    def photo_search(options={})
      response = connection.get do |req|
        req.url "PhotoSearchAPI/#{@api_version}", options
      end
      # if error happens, raise APIError from return_error_or_body function.
      body = return_error_or_body(response, response.body.response)
      map_photos_from_response(body)
    end

    # photo api json format is different from other api schemes.
    # rest api response scheme:
    # {
    #   "@attributes": {
    #     "api_version": "..."
    #   },
    #   "total_hit_count": "...",
    #   "hit_per_page": "...",
    #   "page_offset": "...",
    #   "rest": [
    #     ...
    #    ]
    #   }
    # }

    # photo api response scheme:
    # {
    #   "response": {
    #     "@attributes": {
    #       "api_version": "20150630"
    #     },
    #     "total_hit_count": 2,
    #     "hit_per_page": 2,
    #     "0": {
    #       "photo": {
    #         ...
    #       }
    #     },
    #     "1": ...
    #   }
    # }

    # therefore convert response for photos, it means convert response to that:
    # [
    #    {photo hashie},
    #    ...
    # ]
    def map_photos_from_response(res)
      index = 0
      photos = Hashie::Array.new
      while res.include?(index.to_s)
        photos.push(res[index.to_s].photo)
        index += 1
      end
      photos
    end

  end
end