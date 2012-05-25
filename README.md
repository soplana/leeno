# Leeno

TODO: Write a gem description

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

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
