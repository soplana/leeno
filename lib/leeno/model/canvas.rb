include Leeno

class Leeno::Model::Canvas < Model::Base
  FIELDS = [
     :canvas_id,
     :title,
     :name,
     :width,
     :height,
     :tags,
     :total_history,
     :total_favorite,
     :create_date,
     :update_date
  ]
  attr_accessor *FIELDS
  def initialize data={}
    super(data)
  end

  def histories
    @histories ||= Leeno::Array.new( Api::History.find_histories(canvas_id) )
  end
end
