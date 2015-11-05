module Revepast
  module Parser
    class Assets
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

        @matches, @bad_lines = @utils.regex_match_lines(assets_regex, lines)
        @result = results
      end

      def results
        @matches.map do |match|
          {
            'name' => match[0],
            'quantity' => Utils.quantity_to_i(match[1] || 1),
            'group' => match[2],
            'category' => match[3],
            'size' => match[4],
            'slot' => match[5],
            'volume' => match[6],
            'meta level' => match[7],
            'tech level' => match[8]
          }
        end
      end

      def assets_regex
        Regexp.new(
        /^(?<name>[\S ]*)                             # name
          \t(?<quantity>[\d[[:space:]],'\.]*)         # quantity
          (\t(?<group>[\S ]*))?                       # group
          (\t(?<category>[\S ]*))?                    # category
          (\t(?<size>XLarge|Large|Medium|Small|))?    # size
          (\t(?<slot>High|Medium|Low|Rigs|[\d\s]*))?  # slot
          (\t(?<volume>[\d[[:space:]],\.]* m3))?      # volume
          (\t(?<meta-level>[\d]+|))?                  # meta level
          (\t(?<tech-level>[\d]+|))?$/x               # tech level
        )
      end
    end
  end
end

