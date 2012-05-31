class Leeno::Api::History < Leeno::Api::Base
  class << self
    def find c_id, h_id, options={}
      return nil if (c_id.nil? || h_id.nil?)
      search_show({canvas_id: c_id.to_s, history_id: h_id.to_s}.merge(options))
    end
   
    def find! c_id, h_id, options={}
      raise(Leeno::DocumentNotFound.new("#{model_class}: canvas_id or history_id NilClass")) if (c_id.nil? || h_id.nil?)
      search_show({canvas_id: c_id.to_s, history_id: h_id.to_s}.merge(options), true)
    end
   
    def find_histories id, options={}
      return nil if id.nil?
      search_index({canvas_id: id.to_s}.merge(options))
    end

    def find_histories! id, options={}
      raise(Leeno::DocumentNotFound.new("#{model_class}: id NilClass")) if id.nil?
      search_index({canvas_id: id.to_s}.merge(options), true)
    end

    private
    def url
      return {
        show:  "/api/history.json",
        index: "/api/histories.json"
      }
    end
   
    def default_options
      return {
        canvas: true,
        parent: true,
        children: true
      }
    end
  end
end
