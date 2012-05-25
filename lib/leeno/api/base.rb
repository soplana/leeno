module Leeno::Api
  class Base
    include Leeno
    @@conn = Faraday.new(:url => Leeno::DOMAIN) do |builder|
      builder.request  :url_encoded
      builder.adapter  :net_http
      builder.response :json
    end
   
    private
    def self.url;              raise; end
    def self.default_options;  raise; end
    def self.model_class;      raise; end
   
    def self.set_options! options
      @@options = default_options.merge(options)
    end

    def self.request_show
      result = get(url[:show])
      model_class.new(result)
    end

    def self.request_index
      results = get(url[:index])
      results.map{|result| model_class.new(result)}
    end

    def self.get url
      @@conn.get(url, @@options).body['result']
    end
  end
end
