require 'hashie'

module Gurunavi
  module Rests

    # Ref: http://api.gnavi.co.jp/api/manual/restsearch/
    def rest_search(options={})
      response = connection.get do |req|
        req.url "RestSearchAPI/#{@api_version}", options
      end
      response_body = return_error_or_body(response, response.body.rest)
      convert_to_array_if_needed(response_body)
    end

    # Ref: http://api.gnavi.co.jp/api/manual/foreignrestsearch/
    def foreign_rest_search(options={})
      response = connection.get do |req|
        req.url "ForeignRestSearchAPI/#{@api_version}", options
      end
      response_body = return_error_or_body(response, response.body.rest)
      convert_to_array_if_needed(response_body)
    end
  end
end
