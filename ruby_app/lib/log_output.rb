# frozen_string_literal: true

require_relative './log_parser'
require_relative './log_processor'

class LogOutput
  attr_reader :file

  def initialize(file)
    @file = file
  end

  def total_views
    log_processor.execute.sort_by { |obj| -obj[:total_uniq][0] }
                 .map { |obj| "#{obj[:url]} #{obj[:total_uniq][0]} visits" }
  end

  def uniq_views
    log_processor.execute.sort_by { |obj| -obj[:total_uniq][1] }
                 .map { |obj| "#{obj[:url]} #{obj[:total_uniq][1]} unique view" }
  end

  private

  def logs
    LogParser.call(file)
  end

  def log_processor
    @log_processor ||= LogProcessor.new(logs)
  end
end
