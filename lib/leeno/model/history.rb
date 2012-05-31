include Leeno

class Leeno::Model::History < Model::Base
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
    @canvas   = Model::Canvas.new(data["canvas"])  unless data["canvas"].nil?
    @parent   = Model::History.new(data["parent"]) unless data["parent"].nil?
    @children = Leeno::Array.new(data["children"].map{|h|Model::History.new(h)}) unless data["children"].nil?
  end

  def canvas
    @canvas ||= Api::Canvas.find(canvas_id)
  end
 
  def parent
    return nil if (parent_id.nil? || parent_id.to_i == 0)
    @parent ||= Api::History.find(canvas_id, parent_id)
  end
  
  def children
    @children ||= Leeno::Array.new(Api::History.find(canvas_id, history_id).children)
  end

end
