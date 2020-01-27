# frozen_string_literal: true

class LogProcessor
  attr_reader :logs

  def initialize(logs)
    @logs = logs
  end

  def execute
    group_by_url.map { |key, value| { url: key, total_uniq: ip_list(value) } }
  end

  private

  def group_by_url
    logs.group_by { |log| log[:url] }
  end

  def ip_list(value)
    ip_addresses = value.collect { |obj| obj[:ip_address] }
    [ip_addresses.count, ip_addresses.uniq.count]
  end
end
