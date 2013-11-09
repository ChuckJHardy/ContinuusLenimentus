require "continuus_lenimentus/formatters/rspec"
require "continuus_lenimentus/formatters/simplecov"

module ContinuusLenimentus
  module Formatters
    include Rspec
    include Simplecov
  end
end
