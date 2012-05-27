module Leeno::Model
  class Base
    def initialize data
      self.class::FIELDS.each do |field| 
        value = (field.to_s =~ /_date$/ ? Time.new(data[field.to_s]) : data[field.to_s])
        self.__send__("#{field}=", value)
      end
    end

    def exclude_options!
      @exclude_options = true
      return self
    end

    def include_options!
      @exclude_options = false
      return self
    end

    def exclude_options?
      return !!@exclude_options
    end

    def to_json
      self.class::FIELDS.inject({}){|hash, field| hash[field] = self.__send__("#{field}");hash }
    end
  end
end
