# frozen_string_literal: true

require_relative './log_output'

begin
  file = File.open(ARGV[0])
  display = LogOutput.new(file)
  p 'List of webpages with most page views ordered from most pages views to less page views: '
  display.total_views.map { |view| p view }

  p 'List of webpages with most unique page views ordered from most pages views to less page views: '
  display.uniq_views.map { |view| p view }
rescue StandardError => e
  p e.message
end
