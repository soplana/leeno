# -*- encoding: UTF-8 -*-
require File.expand_path(File.join('../', 'spec_helper'), File.dirname(__FILE__))
include Leeno::Model

describe Canvas do
  before do
    success!
    @canvas = Leeno::Api::Canvas.find("1cz")
  end

  describe "インスタンス変数が正しく設定されていること" do
    it do
      @canvas.instance_variables.should == [:@canvas_id, :@title, :@name, :@width, :@height, :@tags, :@total_history, :@total_favorite, :@create_date, :@update_date]
    end
  end

  describe ".histories" do
    before do
      success!
    end

    it "Model::Historyクラスの配列が取得できること" do
      histories = Leeno::Api::Canvas.find("1cz").histories
      histories.map(&:class).uniq.should == [Leeno::Model::History]
    end
   
    it "@historiesがnilであること" do
      canvas = Leeno::Api::Canvas.find("1cz")
      canvas.instance_eval{@histories}.should be_nil
    end

    it ".historiesを呼び出したら@historiesに結果が代入されること" do
      canvas = Leeno::Api::Canvas.find("1cz")
      histories = canvas.histories
      canvas.instance_eval{@histories}.should == histories
    end
  end

  describe ".to_json" do
    it "インスタンス変数 => 値形式に変換されること" do
      success!
      canvas = Leeno::Api::Canvas.find("1cz")
      canvas.to_json.keys.should == canvas.instance_variables.map{|i|i.to_s.sub(/@/,"").to_sym}
    end
  end
end
