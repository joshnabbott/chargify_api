module ChargifyApi
  class List < Array
    # List#search performs a search on each object in the list
    # :search_method is the attribute or method you want to search (eg: :name)
    # :search_term is the term you want to search for (eg: 'Josh')
    # Search term can be a regular expresion or a string. Search method must be a method
    # or attribute of the objects in the collection or an undefined method error will be raised.
    def search(search_method, search_term)
      self.select { |list_item| list_item.send(search_method) =~ /#{search_term}/i }
    end
  end
end

