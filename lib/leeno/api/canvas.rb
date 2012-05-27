class Leeno::Api::Canvas < Leeno::Api::Base
  class << self
    def find id, options={}
      search(id, options)
    end

    def find! id, options={}
      search(id, options, true)
    end

    def model_class
      Leeno::Model::Canvas
    end

    private
    def search id, options, throws=false
      return nil if id.nil?
      set_options!({canvas_id: id.to_s}.merge(options))
      return ( throws ? request_show! : request_show )
    end

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
