require 'gibberish'

module ContinuusLenimentus
  class Safe
    def initialize(data)
      @data = data
    end

    def self.encrypt(data)
      new(data).encrypt
    end

    def self.decrypt(data)
      new(data).decrypt
    end

    def encrypt
      cipher.enc(@data)
    end

    def decrypt
      cipher.dec(@data)
    end

    private

    def cipher
      Gibberish::AES.new(key)
    end

    def key
      ContinuusLenimentus.configuration.key
    end
  end
end
