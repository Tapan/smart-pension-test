# frozen_string_literal: true

require_relative '../../spec/spec_helper'

RSpec.describe LogParser do
  describe '.call' do
    subject(:parser) { described_class.call(file_path) }

    let(:file_path) { 'spec/fixtures/sample.log' }

    let(:line_1) { { url: 'contact', ip_address: '184.123.665.067' } }
    let(:line_2) { { url: 'home', ip_address: '184.123.665.067' } }

    context 'when script receives other than given logfile' do
      let(:file_path) { 'spec/fixtures/random.log' }

      it 'raises an exception' do
        expect { subject }
          .to raise_error(RuntimeError, "No such file or directory @ #{file_path}")
      end
    end

    context 'when script recives given logfile' do
      it 'parse the logfile' do
        expect(subject).to include(line_1, line_2)
      end
    end
  end
end
