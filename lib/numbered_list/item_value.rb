
  class NumberedList::ItemValue < Value.new(:name, :formatted, :order_value, :description)
    def builder_method_name
      method_name.to_sym
    end
    def method_name
      name.downcase.gsub(":", "_")
    end
    def query_method_name
      "#{method_name}?".to_sym
    end
    def to_item_description
      "#{formatted} :: #{description}"
    end
  end
