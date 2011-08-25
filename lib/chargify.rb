module ChargifyApi
  class Chargify
    attr_accessor :connection

    def initialize(api_key, subdomain)
      @api_key    = api_key
      @subdomain  = subdomain
      @connection = Connection.new(@api_key, @subdomain)
    end

    def transactions
      @transactions ||= Transactions.new(self.connection)
    end
  end
end
