# CorreiosBr
[![Coverage Status](https://coveralls.io/repos/github/henriqueaf/correios_br/badge.svg)](https://coveralls.io/github/henriqueaf/correios_br)
[![Build Status](https://travis-ci.com/henriqueaf/correios_br.svg?branch=master)](https://travis-ci.com/henriqueaf/correios_br)

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/correios_br`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'correios_br'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install correios_br

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

If you want to install in a more specific way:

Build the gem locally: (this command will generate a file with gem name like `correios_br-0.1.0.gem`)

    $ gem build correios_br.gemspec

And then, install the gem locally:

    $ gem install correios_br-0.1.0.gem

To use the gem in `irb` or other projet, just `require` the gem like:

```ruby
2.5.1 :001 > require 'correios_br'
 => true

2.5.1 :002 > CorreiosBr::CEP::get_address('01023902')
 => {:zipcode=>"01023-902", :address=>"Rua Barão de Duprat", :complement=>"449", :neighborhood=>"Centro", :city=>"São Paulo", :state=>"SP", :unity=>"", :ibge=>"3550308", :gia=>"1004"}

2.5.1 :003 > CorreiosBr::CEP::get_address(88010200)
 => {:zipcode=>"88010-200", :address=>"Rua Francisco Tolentino", :complement=>"", :neighborhood=>"Centro", :city=>"Florianópolis", :state=>"SC", :unity=>"", :ibge=>"4205407", :gia=>""}
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/correios_br.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
