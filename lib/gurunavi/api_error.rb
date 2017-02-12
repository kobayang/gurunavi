module Gurunavi

  class APIErrorFactory
    class << self
      # error responces document is bellow:
      # http://api.gnavi.co.jp/api/manual/restsearch/#errors
      ERRORS = {
        "429" => "TooManyAccess",
        "600" => "NoShop",
        "601" => "InvalidAccess",
        "602" => "InvalidShopNumber",
        "603" => "InvalidType",
        "604" => "InternalServerError",
      }.freeze

      def call_api_errors(code, message)
        if ERRORS.include?(code.to_s)
          return Gurunavi.const_get(ERRORS[code.to_s]).new(code, message)
        end
        # no definition status in ERRORS, return APIError
        return Gurunavi::APIError.new(code, message)
      end
    end
  end

  # Custom error class for rescuing from all Gurunavi API errors
  class APIError < StandardError
    attr_reader :code, :message

    def initialize(code, message)
      @code = code
      @message = message
    end

    def message
      "#{@code} - #{@message}"
    end
    alias :to_s :message
  end

  # ClientError is base for api errors of client error
  # Raised when Gurunavi returns a 4xx HTTP status code
  class ClientError < APIError; end

  # Raised when Gurunavi returns the HTTP status code 429
  class TooManyAccess < ClientError; end

  # ServerError is base for api errors of server error
  # Raised when Gurunavi returns a 6xx HTTP status code
  class ServerError < APIError; end

  # Raised when Gurunavi returns the HTTP status code 600
  class NoShop < ServerError; end

  # Raised when Gurunavi returns the HTTP status code 601
  class InvalidAccess < ServerError; end

  # Raised when Gurunavi returns the HTTP status code 602
  class InvalidShopNumber < ServerError; end

  # Raised when Gurunavi returns the HTTP status code 603
  class InvalidType < ServerError; end

  # Raised when Gurunavi returns the HTTP status code 604
  class InternalServerError < ServerError; end

end
