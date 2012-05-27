# -*- encoding: UTF-8 -*-
require File.expand_path(File.join('../', 'spec_helper'), File.dirname(__FILE__))
require 'leeno'
include Leeno::Model

describe Canvas do
  before do
    sample = {
      "canvas_id"      => "1cz", 
      "title"          => "タイトル無し", 
      "name"           => "名無しさん", 
      "width"          => 600, 
      "height"         => 400, 
      "tags"           => ["エビ天の妖精"], 
      "total_history"  => 50, 
      "total_favorite" => 0, 
      "create_date"    => "2012-03-28T15:03:47+09:00", 
      "update_date"    => "2012-05-08T15:52:39+09:00"
    }
    @canvas = Canvas.new(sample)
  end

  describe "インスタンス変数が正しく設定されていること" do
    it "canvas_id"   do @canvas.canvas_id.should ==      "1cz" end
    it "title"       do @canvas.title.should     ==      "タイトル無し" end
    it "name"        do @canvas.name.should      ==      "名無しさん" end
    it "width"       do @canvas.width.should     ==      600 end
    it "height"      do @canvas.height.should    ==      400 end
    it "tags"        do @canvas.tags.should      ==      ["エビ天の妖精"] end
    it "total"       do @canvas.total_history.should  == 50 end
    it "totale"      do @canvas.total_favorite.should == 0 end
    it "create_date" do @canvas.create_date.should ==    Time.new("2012-03-28T15:03:47+09:00") end
    it "update_date" do @canvas.update_date.should ==    Time.new("2012-05-08T15:52:39+09:00") end
  end

end
