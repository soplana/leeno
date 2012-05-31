# encoding: utf-8
require "rubygems"
require 'mocktra'
require 'leeno'
#require 'rspec/rails'


def success!
  Mocktra('leeno.jp') do
    get '/api/canvas.json' do
      return '{"result":{"canvas_id":"1cz","title":"\u30bf\u30a4\u30c8\u30eb\u7121\u3057","name":"\u540d\u7121\u3057\u3055\u3093","width":600,"height":400,"total_history":50,"total_favorite":0,"create_date":"2012-03-28T15:03:47+09:00","update_date":"2012-05-08T15:52:39+09:00"},"status":"ok","message":""}'
    end
    get '/api/history.json' do
      return '{"result":{"history_id":2,"parent_id":1,"canvas_id":"158","image_large":"http://s3-ap-northeast-1.amazonaws.com/leeno/c/158-2/image.png","image_small":"http://s3-ap-northeast-1.amazonaws.com/leeno/c/158-2/image_thumb.png","image_thumb":"http://s3-ap-northeast-1.amazonaws.com/leeno/c/158-2/image_small_thumb.png","create_date":"2012-03-04T00:31:54+09:00","update_date":"2012-05-01T00:38:04+09:00"},"status":"ok","message":""}'
    end
    get '/api/histories.json' do
      return '{"result":[{"history_id":1,"parent_id":null,"canvas_id":"158","image_large":"http://s3-ap-northeast-1.amazonaws.com/leeno/c/158-1/image.png","image_small":"http://s3-ap-northeast-1.amazonaws.com/leeno/c/158-1/image_thumb.png","image_thumb":"http://s3-ap-northeast-1.amazonaws.com/leeno/c/158-1/image_small_thumb.png","create_date":"2012-03-04T00:31:54+09:00","update_date":"2012-05-01T00:38:04+09:00"},{"history_id":2,"parent_id":1,"canvas_id":"158","image_large":"http://s3-ap-northeast-1.amazonaws.com/leeno/c/158-2/image.png","image_small":"http://s3-ap-northeast-1.amazonaws.com/leeno/c/158-2/image_thumb.png","image_thumb":"http://s3-ap-northeast-1.amazonaws.com/leeno/c/158-2/image_small_thumb.png","create_date":"2012-03-04T00:31:54+09:00","update_date":"2012-05-01T00:38:04+09:00"}],"status":"ok","message":""}'
    end
  end
end

def error!
  Mocktra('leeno.jp') do
    get '/api/canvas.json' do
      return '{"result":"","status":"error","message":"Data Not Found"}' 
    end
    get '/api/history.json' do
      return '{"result":"","status":"error","message":"Data Not Found"}' 
    end
    get '/api/histories.json' do
      return '{"result":"","status":"error","message":"Data Not Found"}' 
    end
  end
end

def history_success!
  Mocktra('leeno.jp') do
    get '/api/canvas.json' do
      return '{"result":{"canvas_id":"1cz","title":"\u30bf\u30a4\u30c8\u30eb\u7121\u3057","name":"\u540d\u7121\u3057\u3055\u3093","width":600,"height":400,"total_history":50,"total_favorite":0,"create_date":"2012-03-28T15:03:47+09:00","update_date":"2012-05-08T15:52:39+09:00"},"status":"ok","message":""}'
    end
    get '/api/history.json' do
      return '{"result":{"history_id":2,"parent_id":1,"canvas_id":"1g3","image_large":"http://s3-ap-northeast-1.amazonaws.com/leeno/c/1g3-2/image.png","image_small":"http://s3-ap-northeast-1.amazonaws.com/leeno/c/1g3-2/image_thumb.png","image_thumb":"http://s3-ap-northeast-1.amazonaws.com/leeno/c/1g3-2/image_small_thumb.png","create_date":"2012-05-30T20:08:10+09:00","update_date":"2012-05-30T20:08:10+09:00","canvas":{"canvas_id":"1g3","title":"\u306b\u3082\u3064\u305f\u3061\u3081\u3082","name":"nanany_k","width":600,"height":400,"total_history":3,"total_favorite":0,"create_date":"2012-05-30T11:28:16+09:00","update_date":"2012-05-31T00:37:36+09:00"},"parent":{"history_id":1,"parent_id":null,"canvas_id":"1g3","image_large":"http://s3-ap-northeast-1.amazonaws.com/leeno/c/1g3-1/image.png","image_small":"http://s3-ap-northeast-1.amazonaws.com/leeno/c/1g3-1/image_thumb.png","image_thumb":"http://s3-ap-northeast-1.amazonaws.com/leeno/c/1g3-1/image_small_thumb.png","create_date":"2012-05-30T11:28:16+09:00","update_date":"2012-05-30T11:28:16+09:00"},"children":[{"history_id":3,"parent_id":2,"canvas_id":"1g3","image_large":"http://s3-ap-northeast-1.amazonaws.com/leeno/c/1g3-3/image.png","image_small":"http://s3-ap-northeast-1.amazonaws.com/leeno/c/1g3-3/image_thumb.png","image_thumb":"http://s3-ap-northeast-1.amazonaws.com/leeno/c/1g3-3/image_small_thumb.png","create_date":"2012-05-31T00:37:36+09:00","update_date":"2012-05-31T00:37:36+09:00"}]},"status":"ok","message":""}'
    end
  end
end

$LOAD_PATH << File.expand_path(File.join('..', 'lib'), File.dirname(__FILE__))
