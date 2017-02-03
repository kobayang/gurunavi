module Gurunavi
  class APIError < StandardError

    attr_reader :code, :message

    def initialize(error)
      @code   = error.code
      @message = error.message
    end

    def message
       "#{@code} - #{@message}"
    end
    alias :to_s :message
  end
end
