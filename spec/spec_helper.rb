# encoding: utf-8
require "rubygems"
require 'mocktra'
#require 'rspec/rails'

def canvas_success!
  Mocktra('leeno.jp') do
    get '/api/canvas.json' do
      return '{"result":{"canvas_id":"1cz0","title":"\u30bf\u30a4\u30c8\u30eb\u7121\u3057","name":"\u540d\u7121\u3057\u3055\u3093","width":600,"height":400,"total_history":50,"total_favorite":0,"create_date":"2012-03-28T15:03:47+09:00","update_date":"2012-05-08T15:52:39+09:00"},"status":"ok","message":""}'
    end
  end
end

def canvas_error!
  Mocktra('leeno.jp') do
    get '/api/canvas.json' do
      return '{"result":"","status":"error","message":"Data Not Found"}' 
    end
  end
end

$LOAD_PATH << File.expand_path(File.join('..', 'lib'), File.dirname(__FILE__))
