require 'spec_helper'

describe ContinuusLenimentus do
  let(:instance) { described_class.new }

  describe '.configuration' do
    subject { described_class.configuration }

    it 'returns a configuration instance' do
      expect(subject).to be_an_instance_of(ContinuusLenimentus::Configuration)
    end
  end

  describe '.configure' do
    let(:new_key) { '123' }

    it 'yields the current configuration' do
      expect { |b| described_class.configure(&b) }.to yield_control
    end

    it 'returns the altered configuration' do
      expect(
        described_class.configure { |c| c.key = new_key }
      ).to be_an_instance_of(ContinuusLenimentus::Configuration)

      expect(described_class.configuration.key).to eql(new_key)
    end
  end
end
