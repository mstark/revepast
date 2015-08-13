module Revepast
  module Parser
    class CargoScan
      autoload :Utils, 'revepast/parser'
      include Revepast::Parser

      attr_reader :result, :bad_lines

      def initialize
        @Utils = Utils.new
        @result = {}
        @bad_lines = []
        result = parse
      end

      def parse
        lines = @Utils.sanitize(Revepast.str)
        @result, @bad_lines = @Utils.parse_listing(lines)
      end
    end
  end
end
