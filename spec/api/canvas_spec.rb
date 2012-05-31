# -*- encoding: UTF-8 -*-
require File.expand_path(File.join('../', 'spec_helper'), File.dirname(__FILE__))
include Leeno::Api


describe Canvas do

  describe "#model_class" do
    it "ModelClassが取得出来る事" do 
      Canvas.model_class.should == Leeno::Model::Canvas
    end
  end

  describe "#find" do
    it "第一引数にnilで結果が取得出来ない事" do
      Canvas.find(nil).should == nil
    end

    it "API経由でデータが取得出来る事" do
      success!
      Canvas.find("1cz").class.should == Leeno::Model::Canvas
    end

    it "データの取得が出来ない場合、nilが返される事" do
      error!
      Canvas.find(0).should == nil
    end
  end

  describe "#find!" do
    it "第一引数にnilで結果が取得出来ない事" do
      proc{Canvas.find!(nil)}.should raise_error(Leeno::DocumentNotFound)
    end

    it "API経由でデータが取得出来る事" do
      success!
      Canvas.find!("1cz").class.should == Leeno::Model::Canvas
    end

    it "データの取得が出来ない場合、DocumentNotFoundが返される事" do
      error!
      proc{Canvas.find!(0)}.should raise_error(Leeno::DocumentNotFound)
    end
  end

end
