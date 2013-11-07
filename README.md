[![Build Status](https://travis-ci.org/ChuckJHardy/ContinuusLenimentus.png)](https://travis-ci.org/ChuckJHardy/ContinuusLenimentus) [![Coverage Status](https://coveralls.io/repos/ChuckJHardy/ContinuusLenimentus/badge.png?branch=feature%2Fintegration)](https://coveralls.io/r/ChuckJHardy/ContinuusLenimentus?branch=master) [![Code Climate](https://codeclimate.com/github/ChuckJHardy/ContinuusLenimentus.png)](https://codeclimate.com/github/ChuckJHardy/ContinuusLenimentus) [![Gem Version](https://badge.fury.io/rb/continuus_lenimentus.png)](http://badge.fury.io/rb/continuus_lenimentus) [![Dependency Status](https://gemnasium.com/ChuckJHardy/ContinuusLenimentus.png)](https://gemnasium.com/ChuckJHardy/ContinuusLenimentus)

# Continuus Lenimentus

A SimpleCov Formatter for Continuus Lenimentus Local CI. When the spec suite is run a file is generated with data on the state of the test suite. This is encrypted with a key to ensure minimal conflicts when using version control.

## Installation

Add this line to your application's Gemfile:

    gem 'continuus_lenimentus', '~> 0.0.1'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install continuus_lenimentus

## Usage

Within your applications `.simplecov` file add `SimpleCov::Formatter::ContinuusLenimentusFormatter` as a formatter.

    require 'continuus_lenimentus'

    SimpleCov.configure do
      start('rails') do
        formatter SimpleCov::Formatter::MultiFormatter[
          SimpleCov::Formatter::HTMLFormatter,
          SimpleCov::Formatter::ContinuusLenimentusFormatter
        ]
      end
    end
    
And within your `spec_helper.rb` file add a configuration block if required.

    require "simplecov"
    require 'continuus_lenimentus'

    ContinuusLenimentus.configure do |config|
      config.key = 'MQofYpgCMZ79shxTtgYiQFEuvPdw'
      config.file = 'ci.enc'
      config.directory = Dir.getwd
      condig.message = "CI generated."
    end

Each time you run your spec suite a file will be generated.

## Configuration

* `encrypted` indicates whether the generated file should be encrypted. `true`
* `key` is used when encrypting the generated file. `wdPvuEFQiYgtTxhs97ZMCgpYfoQM`
* `file` is the name of the generated file. `continuus_lenimentus.enc`
* `directory` is the directory where the generated file will be saved. `/coverage`
* `message` is the output displayed on the screen each time the tests are run `Continuous Integration report generated.`

## Requirements

* ruby > 1.9.x
* simplecov > 0.7.x
* gibberish > 1.3.x

## Contributing [![Maintained Status](http://stillmaintained.com/ChuckJHardy/ContinuusLenimentus.png)](http://stillmaintained.com/ChuckJHardy/ContinuusLenimentus)

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
