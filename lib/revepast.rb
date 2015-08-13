require 'revepast/version'
require 'revepast/exceptions'
require 'revepast/parser'

module Revepast
  class << self; attr_accessor :str; end

  class Parse
    attr_reader :result
    def initialize(str)
      Revepast.str = str
      parser_table = %w(EFT CargoScan)
      parser_table.each do |classname|
        begin
          parse = Object.const_get('Revepast::Parser').const_get(classname).new
          if parse
            result = parse.result
            bad_lines = parse.bad_lines
            @result = [classname, result, bad_lines]
            return
              end
        rescue Unparsable

        end
      end
      fail Unparsable.new('No valid parser found for the givin text.')
    end
  end
end
