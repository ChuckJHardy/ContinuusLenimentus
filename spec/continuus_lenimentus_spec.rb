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

  describe '#format' do
    subject { formatter.format(result)  }

    let(:formatter) { SimpleCov::Formatter::ContinuusLenimentusFormatter.new }
    let(:result) do
      double(
        'SimpleCov::Result',
        created_at: "2013-11-05 18:35:29 +0000",
        command_name: "RSpec",
        covered_percent: 100.0,
        covered_strength: 1.1428571428571428,
        covered_lines: 21,
        total_lines: 21
      )
    end

    let(:data) { ContinuusLenimentus::Adapter.new(result).as_json }

    it 'class off to Save with Adapted results' do
      ContinuusLenimentus::Save.should_receive(:this).with(data)

      described_class.should_receive(:puts).
        with(ContinuusLenimentus.configuration.message)

      expect(subject).to eq(result)
    end
  end
end
