module ChargifyApi
  class Transactions
    URI = '/transactions.json'

    attr_accessor :uri, :connection

    def initialize(connection)
      @connection = connection
      @uri        = URI
    end

    # Returns all transactions matching `options` passed
    # Valid options are:
    # kinds: An array of transaction types. Must be any of the following:
    # charge, refund, payment, credit, payment_authorization, info, adjustment
    # since_id: Returns transactions with an id greater than or equal to the one specified
    # max_id: Returns transactions with an id less than or equal to the one specified
    # since_date (format YYYY-MM-DD): Returns transactions with a created_at date greater than or equal to the one specified
    # until_date (format YYYY-MM-DD): Returns transactions with a created_at date less than or equal to the one specified
    # page and per_page: The page number and number of results used for pagination. By default results are paginated 20 per page.
    # A few usage examples:
    # Last 15 transactions that are "payment" or "payment_authorizations":
    # @chargify.transactions.get(:kinds => ['payment', 'payment_authorizations'], :per_page => 15)
    # 50 transactions per page, second page.
    # @chargify.transactions.get(:page => 2, :per_page => 50)
    # Last 6 days worth of transactions:
    # @chargify.transactions.get(:since_date => Date.today - 7, :until_date => Date.today - 1)
    def get(options = {})
      self.get_all(options)
    end

    protected
      def get_all(query_string)
        response = self.connection.get(self.uri, query_string)

        if response.code.to_s =~ /^2\d+$/
          response.parsed_response.inject(List.new) do |list, item|
            list << Transaction.new(item['transaction'])
            list
          end
        else
          raise response.to_s
        end
      end
  end
end

