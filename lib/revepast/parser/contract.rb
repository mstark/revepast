module Revepast
  module Parser
    class Contract
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

        @matches, @bad_lines = @utils.regex_match_lines(contract_regex, lines)
        @matches2, @bad_lines = @utils.regex_match_lines(contract_regex2, @bad_lines)
        puts @bad_lines
        @result = results
      end

      def results
        items1 = Hash.new(0)
        items2 = Hash.new(0)
        @matches.each do |match|
          items1[match.join("_")] += Utils.quantity_to_i(match[1] || 1)
        end
        @matches2.each do |match|
          items2[match.join("_")] += Utils.quantity_to_i(match[1] || 1)
        end

        result1 = []
        result2 = []
        items1.each do |key, value|
          name, quantity, type, category, details = key.split("_")
          result1 << {
            "name" => name,
            "quantity" => value,
            "type" => type,
            "category" => category,
            "details" => details,
            "fitted" => (details || "").start_with?('Fitted')
          }
        end

        items2.each do |key, value|
          name, quantity, type = key.split("_")
          result2 << {
            "name" => name,
            "quantity" => value,
            "type" => type
          }
        end

        result1 + result2
      end

      def contract_regex
        Regexp.new(
        /^(?<name>[\S ]*)\t        # name
         (?<quantity>[\d,'\.]*)\t  # quantity
         (?<type>[\S ]*)\t         # type
         (?<category>[\S ]*)\t     # category
         (?<details>[\S ]*)$/x     # details
        )
      end

      def contract_regex2
        Regexp.new(
        /^(?<name>[\S ]*)\t         # name
          (?<quantity>[\d,'\.]*)\t  # quantity
          (?<type>[\S ]*)$/x        # type
        )
      end

    end
  end
end
