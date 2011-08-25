module ChargifyApi
  class ListItem < OpenStruct
    attr_accessor :id

    def initialize(attributes = {})
      @id = attributes['id']

      super
    end
  end
end
