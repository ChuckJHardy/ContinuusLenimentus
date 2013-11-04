# SimpleLocalCI

A SimpleCov Formatter for Local CI.

## Installation

Add this line to your application's Gemfile:

    gem 'simple-local-ci', '~> 0.0.1'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple-local-ci

## Usage

Within your applications `.simplecov` file add `SimpleLocalCI` as a formatter.

    require 'simple-local-ci'

    SimpleCov.configure do
      start('rails') do
        formatter SimpleCov::Formatter::MultiFormatter[
          SimpleCov::Formatter::HTMLFormatter,
          SimpleCov::Formatter::SimpleLocalCI
        ]
      end
    end

Each time you run your spec suite a file will be generated.

## Requirements

* ruby > 1.9.x

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
