require 'faraday'
require 'faraday_middleware'

module Leeno::Api
  class Base
    include Leeno
    DOMAIN = 'http://leeno.jp'
    
    @@conn = Faraday.new(:url => DOMAIN) do |builder|
      builder.request  :url_encoded
      builder.adapter  :net_http
      builder.response :json
    end
   
    private
    class << self
      def url;              raise; end
      def default_options;  raise; end

      def model_class
        eval(self.to_s.gsub(/Api/, "Model"))
      end
     
      def set_options! options
        @@options = default_options.merge(options)
      end

      def search_show options, throws=false
        set_options!(options)
        throws ? request_show! : request_show
      end

      def search_index options, throws=false
        set_options!(options)
        throws ? request_index! : request_index
      end

      def request_show
        result = get(url[:show])
        result.nil? ? nil : model_class.new(result)
      end

      def request_index
        results = get(url[:index])
        return Leeno::Array.new if results.nil?
        Leeno::Array.new results.map{|result| model_class.new(result)}
      end

      def request_show!
        model_class.new get(url[:show], true)
      end

      def request_index!
        results = get(url[:index], true)
        Leeno::Array.new results.map{|result| model_class.new(result)}
      end

      def get url, throws=false
        data = @@conn.get(url, @@options).body
        return ( throws ? result_set!(data) : result_set(data) )
      end
      
      def result_set! data
        return data['result'] if success?(data)
        raise Leeno::DocumentNotFound.new("#{model_class}: #{data['message']}")
      end
      
      def result_set data
        return data['result'] if success?(data)
        return nil
      end

      def success? data
        data['status'] == 'ok'
      end
    end
  end
end
