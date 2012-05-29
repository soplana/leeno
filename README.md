# Leeno

ラクガキサービスLeeno( http://leeno.jp/ )のAPIを利用する為のgemです


## Installation

    $ git clone git@github.com:soplana/leeno.git
    $ cd Leeno
    $ gem build leeno.gemspec
    $ rake install 
    $ irb
    
    irb(main):001:0> require "leeno"
    => true
    irb(main):003:0> Leeno::Api::History.find("1cz", 1).to_json
    => {:canvas_id=>"1cz", :history_id=>1 ... :update_date=>"2012-05-08T15:52:39+09:00"}}


## Usage

### Canvasを取得する
---
    # Canvas#find success
    > Leeno::Api::Canvas.find("1cz")
    => #<Leeno::Model::Canvas:0x00000 ... >
    # Canvas#find error
    > Leeno::Api::Canvas.find(0)
    => nil

    # Canvas#find! success
    > Leeno::Api::Canvas.find("1cz")
    => #<Leeno::Model::Canvas:0x00000 ... >
    # Canvas#find! error
    > Leeno::Api::Canvas.find(0)
    Leeno::DocumentNotFound: Leeno::Model::Canvas: Data Not Found

### Historyを取得する
---
    > Leeno::Api::History.find("1cz", 1)
    => #<Leeno::Model::History:0x00000 ... >

### Canvasに紐づくHistoryを全て取得する
---
    > Leeno::Api::Canvas.find("1cz").histories 
    => [#<Leeno::Model::History:0x00000 ... >

    # History#find_histories success
    > Leeno::Api::History.find_histories("1cz")
    => [#<Leeno::Model::History:0x00000 ... >
    # History#find_histories error
    > Leeno::Api::History.find_histories("1cz")
    => nil

    # History#find_histories! success
    > Leeno::Api::History.find_histories!("1cz")
    => [#<Leeno::Model::History:0x00000 ... >
    # History#find_histories! error
    > Leeno::Api::History.find_histories!("1cz")
    Leeno::DocumentNotFound: Leeno::Model::History: Data Not Found

### HistoryのParent(編集元History)を取得する
---
    > Leeno::Api::History.find("1cz", 2).parent 
    => #<Leeno::Model::History:0x00000 ... >

### json形式に変換する
---
    > Leeno::Api::Canvas.find("1cz").to_json
    => {:canvas_id=>"1cz", :title=>"タイトル無し", :name=>"名無しさん", :width=>600, :height=>400, :tags=>["エビ天の妖精"], :total_history=>50, :total_favorite=>0, :create_date=>"2012-03-28T15:03:47+09:00", :update_date=>"2012-05-08T15:52:39+09:00"}
