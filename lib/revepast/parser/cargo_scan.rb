module Revepast
  module Parser
    class CargoScan
      autoload :Utils, 'revepast/parser'
      include Revepast::Parser

      attr_reader :result, :bad_lines

      def initialize
        @utils = Utils.new
        @result = {}
        @bad_lines = []
        parse
      end

      def parse
        lines = @utils.sanitize(Revepast.str)
        @result, @bad_lines = @utils.parse_listing(lines)
        # @matches, @bad_lines = @utils.regex_match_lines(cargo_scan_regex, lines)
        # @result = results
      end

      def results
        @matches.map do |match|
          {
            'quantity' => match[0],
            'name' => match[1]
          }
        end
      end

      def cargo_scan_regex
        Regexp.new(/\A(?<quantity>[\d,'\.]+) ?(?<name>[\S ]+)\z/)
      end
    end
  end
end
