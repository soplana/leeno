class Leeno::Array < Array
  def to_json
    map &:to_json
  end
end
