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
    # Canvas#find not found
    > Leeno::Api::Canvas.find(0)
    => nil

    # Canvas#find! success
    > Leeno::Api::Canvas.find("1cz")
    => #<Leeno::Model::Canvas:0x00000 ... >
    # Canvas#find! not found
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
    # History#find_histories not found
    > Leeno::Api::History.find_histories(0)
    => []

    # History#find_histories! success
    > Leeno::Api::History.find_histories!("1cz")
    => [#<Leeno::Model::History:0x00000 ... >
    # History#find_histories! not found
    > Leeno::Api::History.find_histories!(0)
    Leeno::DocumentNotFound: Leeno::Model::History: Data Not Found

### HistoryのParent(編集元History)を取得する
---
    > Leeno::Api::History.find("1cz", 2).parent 
    => #<Leeno::Model::History:0x00000 ... >

### HistoryのChildren(派生History)を取得する
---
    > Leeno::Api::History.find("1cz", 2).children 
    => [#<Leeno::Model::History:0x0000 ... >]

### json形式に変換する
---
    > Leeno::Api::Canvas.find("1cz").to_json
    => {:canvas_id=>"1cz", ... :update_date=>"2012-05-08T15:52:39+09:00"}
    
    > Leeno::Api::Canvas.find("1cz").histories.to_json
    => [{:canvas_id=>"1cz", ... :update_date=>"2012-05-08T15:52:39+09:00"}]
