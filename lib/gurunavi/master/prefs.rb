module Gurunavi
  module Prefs

    # Ref: http://api.gnavi.co.jp/api/manual/prefmaster/
    def pref_search(options={})
      response = connection.get do |req|
        req.url "master/PrefSearchAPI/#{@api_version}", options
      end
      return_error_or_body(response, response.body.pref)
    end

  end
end