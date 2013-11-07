require 'spec_helper'

describe ContinuusLenimentus::Configuration do
  let(:instance) { described_class.new }

  describe "#encrypted" do
    subject { instance.encrypted }

    it 'returns a default value' do
      expect(subject).to eq(true)
    end

    it 'returns altered value' do
      instance.encrypted = false
      expect(subject).to eq(false)
    end
  end

  describe "#key" do
    subject { instance.key }

    let(:default_key) { 'wdPvuEFQiYgtTxhs97ZMCgpYfoQM' }
    let(:new_key) { '123' }

    it "returns a string" do
      expect(subject).to be_an_instance_of(String)
    end

    it 'returns a default key' do
      expect(subject).to eq(default_key)
    end

    it 'returns altered key' do
      instance.key = new_key
      expect(subject).to eq(new_key)
    end
  end

  describe "#file" do
    subject { instance.file }

    let(:default_file) { 'continuus_lenimentus.enc' }
    let(:new_file) { 'ci.enc' }

    it "returns a string" do
      expect(subject).to be_an_instance_of(String)
    end

    it 'returns a default file name' do
      expect(subject).to eq(default_file)
    end

    it 'returns altered file name' do
      instance.file = new_file
      expect(subject).to eq(new_file)
    end
  end

  describe "#directory" do
    subject { instance.directory }

    let(:default_directory) { '/User/Name/Code/Project/Random/coverage' }
    let(:new_directory) { '/path/to/new/file' }

    before { SimpleCov.stub(coverage_path: default_directory) }

    it "returns a string" do
      expect(subject).to be_an_instance_of(String)
    end

    it 'returns a default directory' do
      expect(subject).to eq(default_directory)
    end

    it 'returns altered directory' do
      instance.directory = new_directory
      expect(subject).to eq(new_directory)
    end
  end

  describe "#message" do
    subject { instance.message }

    let(:default_message) { 'Continuous Integration report generated.' }
    let(:new_message) { 'CI Generated' }

    it "returns a string" do
      expect(subject).to be_an_instance_of(String)
    end

    it 'returns a default message' do
      expect(subject).to eq(default_message)
    end

    it 'returns altered message' do
      instance.message = new_message
      expect(subject).to eq(new_message)
    end
  end
end
