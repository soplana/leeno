class Leeno::Api::Canvas < Leeno::Api::Base
  class << self
    def find id, options={}
      return nil if id.nil?
      search_show({canvas_id: id.to_s}.merge(options))
    end

    def find! id, options={}
      raise(Leeno::DocumentNotFound.new("#{model_class}: id NilClass")) if id.nil?
      search_show({canvas_id: id.to_s}.merge(options), true)
    end

    def model_class
      Leeno::Model::Canvas
    end

    private
    def url
      return {
        show:  "/api/canvas.json",
        index: "/api/canvases.json"
      }
    end

    def default_options
      return {
        tag: true
      }
    end
  end
end
