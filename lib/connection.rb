module ChargifyApi
  class Connection
    attr_accessor :options

    def initialize(api_key, subdomain)
      @api_key   = api_key
      @subdomain = subdomain
      @base_url  = "https://#{@subdomain}.chargify.com/"
    end

    def options
      { :basic_auth => { :username => @api_key, :password => 'x' } }
    end

    def get(uri)
      HTTParty.get(@base_url + uri, options)
    end
  end
end
