module ChargifyApi
  class Transactions
    URI = '/transactions.json'

    attr_accessor :uri, :connection

    def initialize(connection)
      @connection = connection
      @uri        = URI
    end

    def all
      self.get_all
    end

    protected
      def get_all
        response = self.connection.get(self.uri)

        if response.code.to_s =~ /^2\d+$/
          response.parsed_response.inject(List.new) do |list, item|
            list << ListItem.new(item['transaction'])
            list
          end
        else
          raise response.to_s
        end
      end
  end
end
