module Leeno::Model
  class Base
    def initialize data
      self.class::FIELDS.each{|field| self.__send__("#{field}=", data[field.to_s]) }
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
