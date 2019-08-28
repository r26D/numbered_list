
module NumberedList
  class MarshallBase < ActiveRecord::Type::Value

    def value_class
      Item
    end

    def cast(value)
      if value.nil?
        return nil
      end
      if value.is_a?(Hash)
        value_class.new(value["name"])
      else
        value_class.new(value.to_s)
      end
    end

    def serialize(value)
      value.nil? || value.blank? ? nil : value.to_s
    end
  end

end