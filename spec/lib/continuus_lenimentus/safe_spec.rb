require 'spec_helper'

describe ContinuusLenimentus::Safe do
  let(:str) { 'Continuus Lenimentus is a fantastic gem' }

  describe '.encrypt' do
    subject { described_class.encrypt(str) }

    it 'returns encrypted string' do
      expect(subject).to include('U2FsdGV')
    end
  end

  describe '.decrypt' do
    subject { described_class.decrypt(data) }

    let(:data) { described_class.encrypt(str) }

    it 'returns original string' do
      expect(subject).to eq(str)
    end
  end
end
