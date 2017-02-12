require 'forwardable'

module Gurunavi
  class Client
    DEFAULT_CONNECTION_MIDDLEWARE = [
      Faraday::Request::Multipart,
      Faraday::Request::UrlEncoded,
      FaradayMiddleware::Mashify,
      FaradayMiddleware::ParseJson
    ]

    extend Forwardable

    include Rests
    include Photos
    include Areas
    include Prefs
    include AreaCodes
    include Categories

    attr_accessor :keyid, :api_version

    # Initialize the client class that will be used for all Gurunavi API requests.

    # @param [Hash] options
    # @option options String :key_id Your gurunavi app's key_id
    # @option options Array  :connection_middleware A collection of different middleware to be applied when the connection is created

    # Note:
    # A data of :api_version and :format has been already determined.
    # As long as there is no special reason, you don't have to change its.
    def initialize(options={})
      @keyid = options[:keyid]
      @connection_middleware = options[:connection_middleware] || DEFAULT_CONNECTION_MIDDLEWARE

      @format = default_format
      @api_version = default_api_version
    end

    def connection
      params = {}
      params[:keyid] = @keyid if @keyid
      params[:format] = default_format
      @connection ||= Faraday::Connection.new(:url => api_url, :params => params, :headers => default_headers) do |builder|
        @connection_middleware.each do |middleware|
          builder.use *middleware
        end
        builder.adapter Faraday.default_adapter
      end
    end

    # Base URL for api requests.
    def api_url
      "https://api.gnavi.co.jp/"
    end

    # Default parser format for api requests.
    def default_format
      "json"
    end

    # Dedault api version for api url.
    def default_api_version
      "20150630"
    end

    # Helper method to return errors or desired response data as appropriate.
    #
    # Added just for convenience to avoid having to traverse farther down the response just to get to returned data.
    def return_error_or_body(response, response_body)
      error_status = nil
      error_status = response.body["error"] if response.body["error"]
      error_status = response.body["gnavi"]["error"] if response.body["gnavi"] && response.body["gnavi"]["error"]

      if error_status
        raise Gurunavi::APIErrorFactory.call_api_errors(error_status.code, error_status.message)
      end
      response_body
    end

    # Helper method to wrap object into array.
    #
    # this use case is return a object for Gurunavi API when hit per page is 1.
    def convert_to_array_if_needed(response_body)
      unless response_body.instance_of?(Hashie::Array)
        array = Hashie::Array.new
        array.push(response_body)
        return array
      end
      response_body
    end

    private

      def default_headers
        headers = {
          :accept =>  'application/json',
          :user_agent => 'Ruby gem'
        }
      end

  end

end
