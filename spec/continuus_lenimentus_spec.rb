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

  describe '#dump_summary' do
    subject { formatter.dump_summary(duration, example_count, failure_count, pending_count) }

    let(:formatter) { ContinuusLenimentusRspecFormatter.new(output) }
    let(:output) { double('Output', puts: '') }
    let(:runner) { ContinuusLenimentus::Runner.rspec.results }
    let(:duration) { 100 }
    let(:example_count) { 10 }
    let(:failure_count) { 1 }
    let(:pending_count) { 2 }

    let(:expected_hash) do
      {
        duration: duration,
        counts: {
          example: example_count, 
          failure: failure_count, 
          pending: pending_count
        }
      }
    end

    it 'assigns the runner rspec results instance' do
      subject
      expect(runner).to eq(expected_hash)
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

    it 'calls off to Save with Adapted results' do
      ContinuusLenimentus.configuration.encrypted = true
      ContinuusLenimentus::Save.should_receive(:this).with(data)

      described_class.should_receive(:puts).
        with(ContinuusLenimentus.configuration.message)

      expect(subject).to eq(result)
    end
  end
end
