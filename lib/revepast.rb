require 'revepast/version'
require 'revepast/exceptions'
require 'revepast/parser'
require 'revepast/parser/assets'
require 'revepast/parser/eft'
require 'revepast/parser/cargo_scan'

module Revepast
  class << self; attr_accessor :str; end

  class Parse
    attr_reader :result
    PARSER_TABLE = %w(Assets EFT CargoScan)

    def initialize(str)
      Revepast.str = str

      PARSER_TABLE.each do |classname|
        begin
          parse = Object.const_get('Revepast::Parser').const_get(classname).new
          if parse
            result = parse.result
            bad_lines = parse.bad_lines
            next if result.size.zero?
            @result = [classname, result, bad_lines]
            return @result
          end
        rescue Unparsable
        end
      end
      fail Unparsable, 'No valid parser found for the givin text.'
    end
  end
end
