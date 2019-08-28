require "rubygems"
require "active_record"
require "values"
require 'numbered_list/item_value'
require 'numbered_list/marshall_base'
module NumberedList
  class List
    attr_reader :item

    delegate :formatted, :name, :description, :order_value, :to_item_description, to: :item

    class BadType < StandardError
    end

    class DuplicateKey < StandardError
    end

    def self.reset_list!

      list.values.each do |item|

        if respond_to?(item.builder_method_name)

          (
          class << self;
            self;
          end).send(:remove_method, item.builder_method_name)

        end #https://www.ruby-forum.com/topic/116025
        if respond_to?(item.query_method_name)
          remove_method item.query_method_name
        end
      end
      @items = {}
    end

    def self.list
      @items || {}
    end

    def self.add_item(item)

      if list.has_key?(item.name)
        raise DuplicateKey, "The key #{item.name} has already been registered."
      end
      @items ||= {}
      @items[item.name] = item
    end

    def self.add_item_builder(item)

      self.define_singleton_method(item.builder_method_name) do
        self.new(item.name)
      end
    end

    def self.add_item_query(item)
      define_method(item.query_method_name) do
        name == item.name
      end
    end

    def self.item(item_values)

      item = NumberedList::ItemValue.with(item_values)

      add_item(item)
      add_item_builder(item)
      add_item_query(item)
      class_exists = "#{self}::Marshall".constantize rescue nil #https://stackoverflow.com/a/32869926

      add_marshall_class unless class_exists
    end

    def self.add_marshall_class
      klass = self.const_set("Marshall", Class.new(NumberedList::MarshallBase))
      original_class = self
      klass.class_eval do
        define_method(:value_class) do
          return original_class
        end
      end
    end

    def initialize(name)
      if !self.class.types.include?(name.to_s.upcase)
        raise BadType, "'#{name}' Class #{name.class} is not a valid #{self.class.to_s}"
      end
      @item = self.class.find_item(name.to_s)
    end


    def self.find_item(key)
      list && list.has_key?(key) ? list[key] : raise(BadType, "Unable to find the #{key}/#{key.class} for #{self.to_s} #{self.types} NumberedItem")
    end


    def self.description(label)
      find_item(label).description
    end

    def self.as_objs
      self.types.collect { |t| self.new(t) }
    end

    def ==(other)
      other.to_s == self.to_s
    end

    def to_s
      name
    end

    def to_str
      to_s
    end

    def self.types
      list.keys
    end
  end
end