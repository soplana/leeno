class Leeno::Array < Array
  def initialize list=[]
    super(list)
  end
  
  def to_json
    map &:to_json
  end
end
