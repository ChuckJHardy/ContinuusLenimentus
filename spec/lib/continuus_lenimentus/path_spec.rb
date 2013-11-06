require 'spec_helper'

describe ContinuusLenimentus::Path do
  let(:instance) { described_class.new }

  describe '#full' do
    subject { instance.full }

    let(:path) { "/coverage/continuus_lenimentus.enc" }

    it 'returns full path name' do
      expect(subject).to include(path)
    end
  end
end
