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
      end
    end
  end
end
