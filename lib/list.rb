module ChargifyApi
  class List < Array
    def search(search_method, search_term)
      self.select { |list_item| list_item.send(search_method) =~ /#{search_term}/i }
    end
  end
end
