module Revepast
  module Parser
    class EFT
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
        lines = blacklist(@utils.sanitize(Revepast.str))

        fail Unparsable, 'No valid parsable lines' if lines.nil?
        fail Unparsable, 'Invalid EFT title' unless lines.first.include?('[' || ']')

        title = find_title(lines.first)

        ship = title.first.strip
        fit_name = title.last.strip

        modules = find_modules(lines)

        @result = {'ship' => ship,
                   'name' => fit_name,
                   'modules' => modules.map { |i| i },
            }
      end

      def blacklist(array)
        blacklist = ['[empty high slot]',
                     '[empty low slot]',
                     '[empty medium slot]',
                     '[empty rig slot]',
                     '[empty subsystem slot]']
        lines = []
        array.each { |line| lines << line unless blacklist.include? line.downcase }
        lines
      end

      def find_title(line)
        title_parts = line.tr('[]', '').split(',')
        fail Unparsable, 'Invalid EFT title' if title_parts.length != 2
        title_parts
      end

      def find_modules(lines)
        ammo_pattern = /^([\S ]+), ?([\S ]+)$/
        matches, bad_lines = @utils.regex_match_lines(ammo_pattern, lines[1..-1])
        matches2, @bad_lines = @utils.parse_listing(bad_lines)

        module_w_ammo = Hash.new { |h, k| h[k] = 0 }
        matches.each { |m| module_w_ammo[m] += 1 }

        modules = []
        module_w_ammo.sort.each do |(name, ammo), quantity|
          modules << {'name' => name.strip, 'ammo' => ammo.strip, 'quantity' => quantity}
          modules
        end

        matches2.each { |item| modules << item }
        modules
      end
    end
  end
end
