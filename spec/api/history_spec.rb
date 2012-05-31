# -*- encoding: UTF-8 -*-
require File.expand_path(File.join('../', 'spec_helper'), File.dirname(__FILE__))
include Leeno::Api


describe History do

  describe "#model_class" do
    it "ModelClassが取得出来る事" do 
      History.model_class.should == Leeno::Model::History
    end
  end

  describe "#find" do
    it "第一引数,第二引数にnilで結果が取得出来ない事" do
      History.find(nil, nil).should == nil
    end
    
    it "第二引数にnilで結果が取得出来ない事" do
      History.find("1cz", nil).should == nil
    end

    it "データの取得が出来ない場合、nilが返される事" do
      error!
      History.find(0, 0).should == nil
    end
    
    it "API経由でデータが取得出来る事" do
      success!
      History.find("1cz", 1).class.should == Leeno::Model::History
    end
  end

  describe "#find!" do
    it "第一引数,第二引数にnilで結果が取得出来ない事" do
      proc{History.find!(nil, nil)}.should raise_error(Leeno::DocumentNotFound)
    end
    
    it "第二引数にnilで結果が取得出来ない事" do
      proc{History.find!("1cz", nil)}.should raise_error(Leeno::DocumentNotFound)
    end

    it "データの取得が出来ない場合、nilが返される事" do
      error!
      proc{History.find!(0, 0)}.should raise_error(Leeno::DocumentNotFound)
    end
    
    it "API経由でデータが取得出来る事" do
      success!
      History.find!("1cz", 1).class.should == Leeno::Model::History
    end
  end

  describe "#find_histories" do
    it "第一引数にnilで結果が取得出来ない事" do
      History.find_histories(nil).should == Leeno::Array.new
    end

    it "データの取得が出来ない場合、Leeno::Arrayが返される事" do
      error!
      History.find_histories(0).should == Leeno::Array.new
    end
    
    it "結果が二件取得出来る事" do
      success!
      History.find_histories("1cz").size.should == 2
    end
    
    it "history_id: 1, 2が取得出来ている事" do
      success!
      History.find_histories("1cz").map(&:history_id).should == [1,2]
    end
  end

  describe "#find_histories!" do
    it "第一引数にnilで結果が取得出来ない事" do
      proc{History.find_histories!(nil)}.should raise_error(Leeno::DocumentNotFound)
    end

    it "データの取得が出来ない場合、nilが返される事" do
      error!
      proc{History.find_histories!(0)}.should raise_error(Leeno::DocumentNotFound)
    end
    
    it "結果が二件取得出来る事" do
      success!
      History.find_histories!("1cz").size.should == 2
    end
    
    it "history_id: 1, 2が取得出来ている事" do
      success!
      History.find_histories!("1cz").map(&:history_id).should == [1,2]
    end
  end
end

