module Revepast
  module Parser
    class EFT
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
        ammo_pattern = /^([\S ]+), ?([\S ]+)$/
        blacklist = ['[empty high slot]',
                     '[empty low slot]',
                     '[empty medium slot]',
                     '[empty rig slot]',
                     '[empty subsystem slot]']
        sanitize = @Utils.sanitize(Revepast.str)
        lines = []
        sanitize.each do |line|
          lines << line unless blacklist.include? line.downcase
        end
        begin
          lines.first =~ /^(\[).*(\])$/
          ship = lines.first.match(ammo_pattern)[1].tr('[]', '')
          fit_name = lines.first.match(ammo_pattern)[2].tr('[]', '')
        rescue
          raise Unparsable.new('Invalid EFT title line')
        end
        matches, bad_lines = @Utils.regex_match_lines(ammo_pattern, lines[1..-1])
        matches2, bad_lines2 = @Utils.parse_listing(bad_lines)

        @bad_lines = bad_lines2

        module_w_ammo = Hash.new { |h, k| h[k] = 0 }
        matches.each do |m|
          module_w_ammo[m] += 1
        end
        modules = []
        module_w_ammo.sort.each do |(name, ammo), quantity|
          modules << { 'name' => name.strip, 'ammo' => ammo.strip, 'quantity' => quantity }
          modules
        end
        matches2.each do |item|
          modules << item
        end
        @result = { 'ship' => ship,
                    'name' => fit_name,
                    'modules' => modules.map { |i| i }
            }
      end
    end
  end
end
