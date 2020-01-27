# frozen_string_literal: true

require_relative '../../spec/spec_helper'

RSpec.describe LogOutput do
  let(:parser) { LogParser.call(file_path) }

  let(:log_output) { described_class.new(file_path) }
  let(:file_path) { 'spec/fixtures/sample.log' }

  let(:log_processor) { LogProcessor.new(parser) }
  let(:expected_total_views) do
    [
      'about/2 4 visits',
      'help_page/1 4 visits',
      'home 3 visits',
      'contact 2 visits',
      'index 1 visits',
      'about 1 visits'
    ]
  end
  let(:uniq_views) do
    [
      'help_page/1 4 unique view',
      'home 3 unique view',
      'about/2 2 unique view',
      'contact 1 unique view',
      'index 1 unique view',
      'about 1 unique view'
    ]
  end

  context '#total_views' do
    it 'returns list of webpages with most page views ordered from most pages views to less page views' do
      expect(log_output.total_views).to eq expected_total_views
    end
  end

  context '#uniq_views' do
    it 'returns list of webpages with most unique page views ordered from most page views to less page views' do
      expect(log_output.uniq_views).to eq uniq_views
    end
  end
end
