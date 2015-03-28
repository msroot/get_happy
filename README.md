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
	  get_happy add [LINKS]     # add a link to collection
	  get_happy clean           # clean collection
	  get_happy delete          # delete a url
	  get_happy help [COMMAND]  # Describe available commands or one specific command
	  get_happy list            # list collection
	  get_happy play            # play a random song
	  get_happy seed            # seed with some sample urls

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


## Contributing

1. Fork it ( https://github.com/msroot/get_happy/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
