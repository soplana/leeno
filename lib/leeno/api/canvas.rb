class Leeno::Api::Canvas < Leeno::Api::Base
  def self.find id, options={}
    return nil if id.nil?
    set_options!({canvas_id: id.to_s}.merge(options))
    request_show
  end

  private
  def self.url
    return {
      show:  "/api/canvas.json",
      index: "/api/canvases.json"
    }
  end

  def self.default_options
    return {
      tag: true
    }
  end

  def self.model_class
    Model::Canvas
  end
end
