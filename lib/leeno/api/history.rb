class Leeno::Api::History < Leeno::Api::Base
  def self.find c_id, h_id, options={}
    return nil if (c_id.nil? || h_id.nil?)
    set_options!({canvas_id: c_id.to_s, history_id: h_id.to_s}.merge(options))
    request_show
  end
 
  def self.find_histories id, options={}
    return nil if id.nil?
    set_options!({canvas_id: id.to_s}.merge(options))
    request_index
  end

  private
  def self.url
    return {
      show:  "/api/history.json",
      index: "/api/histories.json"
    }
  end
 
  def self.default_options
    return {
      canvas: true,
      parent: true,
      children: true
    }
  end

  def self.model_class
    Model::History
  end
end
