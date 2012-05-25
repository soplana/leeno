class Leeno::Model::History < Leeno::Model::Base
  FIELDS = [
     :canvas_id,
     :history_id,
     :parent_id,
     :image_large,
     :image_small,
     :image_thumb,
     :create_date,
     :update_date
  ]
  attr_accessor *FIELDS
  def initialize data={}
    super(data)
    @canvas = Leeno::Model::Canvas.new(data["canvas"]) unless data["canvas"].nil?
    @parent = Leeno::Model::History.new(data["parent"]).exclude_options! unless data["parent"].nil?
  end

  def canvas
    return nil if exclude_options?
    @canvas ||= Leeno::Api::Canvas.find(canvas_id)
  end
 
  def parent
    return nil if exclude_options?
    return nil if (parent_id.nil? || parent_id.to_i == 0)
    @parent ||= Leeno::Api::History.find(canvas_id, parent_id)
  end
 
  def to_json
    return super if exclude_options?
    json = {}
    json = super.merge(canvas: canvas.to_json) unless canvas.nil?
    json = json.merge(parent: parent.to_json)  unless parent.nil?
    return json
  end
end
