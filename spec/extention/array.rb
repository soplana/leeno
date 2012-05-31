# -*- encoding: UTF-8 -*-
require File.expand_path(File.join('../', 'spec_helper'), File.dirname(__FILE__))

describe Array do

  describe ".to_json" do
    it "castされること" do
      history_success!
      history = Leeno::Api::History.find("1cz", 1)
      history.children.to_json.map(&:class).uniq.should == [Hash]
    end
  end
end
