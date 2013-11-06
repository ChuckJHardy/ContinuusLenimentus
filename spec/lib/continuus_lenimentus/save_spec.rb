require 'spec_helper'

describe ContinuusLenimentus::Save do
  describe '.this' do
    subject { described_class.this(adapter) } 

    let(:adapter) { ContinuusLenimentus::Adapter.new(result).as_json }
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

    let(:path) { 'path/to/file' }
    let(:mode) { 'w+' }
    let(:file) { double('File') }

    it 'writes encryped string to file' do
      ContinuusLenimentus::Path.should_receive(:full).and_return(path)
      File.should_receive(:open).with(path, mode).and_yield(file)
      file.should_receive(:puts).with(an_instance_of(String))

      subject
    end
  end
end
