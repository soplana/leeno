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
    
    it "API経由でデータが取得出来る事" do
      history_success!
      History.find("1cz", 1).canvas_id.should == "1cz"
    end

    it "データの取得が出来ない場合、nilが返される事" do
      error!
      History.find(0, 0).should == nil
    end
  end
end

