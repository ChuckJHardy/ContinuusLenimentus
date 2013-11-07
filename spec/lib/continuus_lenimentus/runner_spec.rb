require 'spec_helper'

describe ContinuusLenimentus::Runner do
  let(:instance) { described_class.new }

  describe '.rspec' do
    subject { described_class.rspec }

    it 'returns an instance of runner' do
      expect(subject).to be_an_instance_of(ContinuusLenimentus::Runner)
    end
  end

  describe "#results" do
    subject { instance.results }

    let(:default) { {} }
    let(:new) { { key: :value} }

    it "returns a hash" do
      expect(subject).to be_an_instance_of(Hash)
    end

    it 'returns a default hash' do
      expect(subject).to eq(default)
    end

    it 'returns altered hash' do
      instance.results = new
      expect(subject).to eq(new)
    end
  end
end
