# frozen_string_literal: true

require_relative '../../spec/spec_helper'

RSpec.describe LogProcessor do
  let(:subject) { described_class.new(logs) }

  let(:logs) do
    [
      { url: '/contact', ip_address: '184.123.665.067' },
      { url: '/home', ip_address: '184.123.665.067' },
      { url: '/about/2', ip_address: '444.701.448.104' },
      { url: '/contact', ip_address: '316.433.849.805' },
      { url: '/contact', ip_address: '316.433.849.805' }
    ]
  end

  let(:total_uniq_ips) do
    [
      { url: '/contact', total_uniq: [3, 2] },
      { url: '/home', total_uniq: [1, 1] },
      { url: '/about/2', total_uniq: [1, 1] }
    ]
  end

  describe '#execute' do
    it 'returns array of objects with url and count of total and uniq visits' do
      expect(subject.execute).to match_array total_uniq_ips
    end
  end
end
