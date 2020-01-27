# frozen_string_literal: true

Line = Struct.new :url, :ip_address
LOG_FORMAT = %r(\/(\w+\/\d+|\w+) (\d{3}\.\d{3}\.\d{3}.\d{3})).freeze

class LogParser
  class << self

    def call(file)
      file_exists?(file)

      parse(file)
    end

    private

    def parse(file)
      file_name = path(file)

      File.foreach(file_name).map do |line|
        line.match(LOG_FORMAT) { |m| Line.new(*m.captures).to_h }
      end
    end

    def path(file)
      File.expand_path file
    end

    def file_exists?(file)
      raise "No such file or directory @ #{file}" unless File.exist? file
    end
  end
end
