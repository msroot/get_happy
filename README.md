[![Gem Version](https://badge.fury.io/rb/get_happy.png)](http://badge.fury.io/rb/get_happy)
[![Build Status](https://travis-ci.org/msroot/get_happy.svg?branch=master)](https://travis-ci.org/msroot/get_happy) 
[![Code Climate](https://codeclimate.com/github/msroot/get_happy/badges/gpa.svg)](https://codeclimate.com/github/msroot/get_happy)
[![Inline docs](http://inch-ci.org/github/msroot/get_happy.svg?branch=master)](http://inch-ci.org/github/msroot/get_happy)
[![Coverage Status](https://coveralls.io/repos/msroot/get_happy/badge.svg?branch=master)](https://coveralls.io/r/msroot/get_happy?branch=master)

# GetHappy

A Gem to make you happy!
Creates a collection in `~/.get_happy/collection.yml` with your favorite links and after by `$ get_happy` open one of them

<img src="https://raw.githubusercontent.com/msroot/get_happy/master/spec/screen_shot.png" align="center" height="129" width="300" style="text-align:center">

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'get_happy'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install get_happy

## Usage

    $ get_happy help
	Commands:
	  get_happy add [LINKS]           # add a link to collection
	  get_happy clean                 # clean collection
	  get_happy delete                # delete a url
	  get_happy help [COMMAND]        # Describe available commands or one specific command
	  get_happy import_playlist [ID]  # import a youtube playlist
	  get_happy list                  # list collection
	  get_happy play                  # play a random song
	  get_happy seed                  # seed with some sample urls

Play a random song

    $ get_happy

List collection

    $ get_happy list
	Ioannis Total 4 
	🚀  https://www.youtube.com/watch?v=s3Q80mk7bxE
	🚀  https://www.youtube.com/watch?v=LxDhlzJR4XQ
	🚀  https://www.youtube.com/watch?v=HqYnevHibaI
	🚀  https://www.youtube.com/watch?v=8kMZcA5oEAA

Seed with some sample urls

    $ get_happy seed


Clean collection

    $ get_happy clean
	=> Collection is empty

Add a link to collection

    $ get_happy add https://www.youtube.com/watch?v=s3Q80mk7bxE

Or add multiply

	
    $ get_happy add https://www.youtube.com/watch?v=s3Q80mk7bxE, https://www.youtube.com/watch?v=PWgvGjAhvIw

Delete a url

	
    $ get_happy delete https://www.youtube.com/watch?v=s3Q80mk7bxE

Import Youtube Playlist
	
    $ get_happy import_playlist  B2A4E1367126848D
	=> Found 25 items
	=> Import playlist?


## Contributing

1. Fork it ( https://github.com/msroot/get_happy/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request



##License 

MIT License Copyright (c) 2015 Yannis Kolovos

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
