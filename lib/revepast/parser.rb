module Revepast
  module Parser
    require 'revepast/parser/eft'
    require 'revepast/parser/cargo_scan'
    class Utils
      def sanitize(str)
        result = []
        str.each_line do |line|
          line = line.chomp.gsub /^$\n/, ''
          result << line unless line.nil? || line == ''
        end
        result
      end

      def regex_match_lines(regex, lines)
        matches = []
        bad_lines = []
        lines.each do |line|
          if line.match(regex)
            a = line.match(regex)
            matches.push(a.captures)
          else
            bad_lines.push(line.chomp)
          end
        end
        [matches, bad_lines]
      end

      def parse_listing(lines)
        # 10 x Cargo Scanner II | 10x Cargo Scanner II | 10 Cargo Scanner II
        listing_re = /^([\d,'\.]+?) ?x? ([\S ]+)$/
        # Cargo Scanner II x10 | Cargo Scanner II x 10 | Cargo Scanner II 10
        listing_re2 = /^([\S ]+?) x? ?([\d,'\.]+)$/
        # Cargo Scanner II
        listing_re3 = /^([\S ]+)$/
        matches, bad_lines = regex_match_lines(listing_re, lines)
        matches2, bad_lines2 = regex_match_lines(listing_re2, bad_lines)
        matches3, bad_lines3 = regex_match_lines(listing_re3, bad_lines2)
        items = Hash.new { |h, k| h[k] = 0 }
        matches.each do |count, name|
          items[name.strip] += count.to_i
        end
        matches2.each do |name, count|
          items[name.strip] += count.to_i
        end
        matches3.each do |res|
          items[res[0].strip] += 1
        end
        results = []
        items.each do |name, quantity|
          results << {
            'name' => name,
            'quantity' => quantity
          }
        end
        [results, bad_lines3]
      end
    end
  end
end
