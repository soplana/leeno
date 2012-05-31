# -*- encoding: UTF-8 -*-
require File.expand_path(File.join('../', 'spec_helper'), File.dirname(__FILE__))
include Leeno::Model

describe History do

  describe "インスタンス変数が正しく設定されていること" do
    context "関連情報を取得しないクエリの場合" do
      before do
        success!
        @history = Leeno::Api::History.find("1cz", 1)
      end

      it "正しく設定されていること" do
        @history.instance_variables.should == [:@canvas_id, :@history_id, :@parent_id, :@image_large, :@image_small, :@image_thumb, :@create_date, :@update_date]
      end

      it "@canvasがnilである事" do
        @history.instance_eval{@canvas}.should be_nil
      end

      it "@parentがnilである事" do
        @history.instance_eval{@parent}.should be_nil
      end
    end
    
    context "関連情報を取得するクエリの場合" do
      before do
        history_success!
        @history = Leeno::Api::History.find("1cz", 1)
      end

      it "正しく設定されていること" do
        @history.instance_variables.should == [:@canvas_id, :@history_id, :@parent_id, :@image_large, :@image_small, :@image_thumb, :@create_date, :@update_date, :@canvas, :@parent, :@children]
      end

      it "@canvasにModel::Canvasクラスが設定されている事" do
        @history.instance_eval{@canvas}.class.should == Leeno::Model::Canvas
      end

      it "@parentにModel::Historyクラスが設定されている事" do
        @history.instance_eval{@parent}.class.should == Leeno::Model::History
      end

      it "@childrenにModel::Historyクラスの配列が設定されている事" do
        @history.instance_eval{@children}.map(&:class).uniq.should == [Leeno::Model::History]
      end
    end
  end
 
  describe ".canvas" do
    before do
      success!
      @history = Leeno::Api::History.find("1cz", 1)
    end
    
    it "canvas(Model::Canvas)が取得出来ること" do
      @history.canvas.class.should == Leeno::Model::Canvas
    end
  end
  
  describe ".parent" do
    before do
      success!
      @history = Leeno::Api::History.find("1cz", 1)
    end
    
    it "parent(Model::History)が取得出来ること" do
      @history.parent.class.should == Leeno::Model::History
    end
  end

  describe ".children" do
    before do
      history_success!
      @history = Leeno::Api::History.find("1cz", 1)
    end

    it "配列が取得出来ること" do
      @history.children.class.should == Leeno::Array
    end

    it "children(Model::History)が取得出来ること" do
      @history.children.first.class.should == Leeno::Model::History
    end

    it "ネストしたModel::Historyの@childrenはnilであること" do
      child = @history.children.first
      child.instance_eval{@children}.should be_nil
    end

    it "ネストしたModel::Historyで一度.childrenを呼び出せばその後@childrenを参照すること" do
      child = @history.children.first
      children = child.children
      child.instance_eval{@children}.should == children
    end
  end

  describe ".to_json" do
    it "インスタンス変数 => 値形式に変換されること" do
      success!
      history = Leeno::Api::History.find("1cz", 1)
      history.to_json.keys.should == history.instance_variables.map{|i|i.to_s.sub(/@/,"").to_sym}
    end
    
    it "インスタンス変数 => 値形式に変換されること[ parent ]" do
      history_success!
      history = Leeno::Api::History.find("1cz", 1).parent
      history.to_json.keys.should == history.instance_variables.map{|i|i.to_s.sub(/@/,"").to_sym}
    end
    
    it "インスタンス変数 => 値形式に変換されること[ children ]" do
      history_success!
      history = Leeno::Api::History.find("1cz", 1).children.first
      history.to_json.keys.should == history.instance_variables.map{|i|i.to_s.sub(/@/,"").to_sym}
    end
  end
end
