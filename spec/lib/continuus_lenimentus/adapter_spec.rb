require 'spec_helper'

describe ContinuusLenimentus::Adapter do
  let(:instance) { described_class.new(result) }

  let(:result) do
    double(
      'SimpleCov::Result',
      created_at: "2013-11-05 18:35:29 +0000",
      command_name: "RSpec",
      covered_percent: 100.0,
      covered_strength: strength,
      covered_lines: 21,
      total_lines: 21
    )
  end

  let(:strength) { 1.1428571428571428 }
  let(:expected_hash) do
    {
      created_at: "2013-11-05 18:35:29 +0000",
      duration: duration,
      counts: rspec_counts,
      metrics: {
        total_lines: 21,
        coverage: {
          percent: 100.0,
          strength: strength,
          lines: 21,
        }
      }
    }
  end

  let(:duration) { 0.003537 }
  let(:rspec_results) do
    {
      duration: duration,
      counts: rspec_counts
    }
  end

  let(:rspec_counts) do
    {
      example: 100, 
      failure: 10, 
      pending: 2
    }
  end

  before do
    ContinuusLenimentus::Runner.rspec.results = rspec_results
  end

  describe '#as_user' do
    subject { instance.as_user }

    before { ContinuusLenimentus.configuration.encrypted = encrypted }

    context 'when encrypted' do
      let(:encrypted) { true }

      it 'returns the json response' do
        expect(subject).to be_an_instance_of(String)
      end
    end

    context 'when encryption' do
      let(:encrypted) { false }

      it 'returns the hash response' do
        expect(subject).to eq(expected_hash)
      end
    end
  end

  describe '#as_json' do
    subject { instance.as_json }

    it 'returns a string' do
      expect(subject).to be_an_instance_of(String)
    end

    it 'returns expected hash' do
      expect(JSON.parse(subject, symbolize_names: true)).to eq(expected_hash)
    end
  end

  describe '#as_hash' do
    subject { instance.as_hash }

    it 'returns a hash' do
      expect(subject).to be_an_instance_of(Hash)
    end

    it 'returns expected hash' do
      expect(subject).to eq(expected_hash)
    end

    context 'coverage strength' do
      context 'is a number' do
        it 'returns strength' do
          expect(subject[:metrics][:coverage][:strength]).to eq(strength)
        end
      end

      context 'is not a number' do
        let(:strength) { 0.0/0.0 }

        it 'returns 0.0' do
          expect(subject[:metrics][:coverage][:strength]).to eq(0.0)
        end
      end
    end
  end
end
