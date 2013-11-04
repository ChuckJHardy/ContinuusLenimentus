require 'spec_helper'

describe ContinuusLenimentus::Configuration do
  let(:instance) { described_class.new }

  describe "#key" do
    subject { instance.key }

    let(:default_key) { 'wdPvuEFQiYgtTxhs97ZMCgpYfoQM' }

    it "returns a string" do
      expect(subject).to be_an_instance_of(String)
    end

    it 'returns a default key' do
      expect(subject).to eq(default_key)
    end
  end

  describe '#key=' do
    subject { instance.key }

    let(:new_key) { '123' }

    before { instance.key = new_key }

    it 'returns altered key' do
      expect(subject).to eq(new_key)
    end
  end
end
