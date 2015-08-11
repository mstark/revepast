module Revepast
	module Parser
		class EFT
			autoload :Utils, 'revepast/parser'
			include Revepast::Parser

			attr_reader :result, :bad_lines

			def initialize(str)
				@Utils = Utils.new
				@result = {}
				@bad_lines = []
				result = parse(@Utils.sanitize(str))
			end

			def parse(str)
				pattern = /^(\S+), ?([\S ]+)$/
		    	ammo_pattern = /^([\S ]+), ?([\S ]+)$/
				blacklist = ['[empty high slot]',
                 			 '[empty low slot]',
                			 '[empty medium slot]',
                			 '[empty rig slot]',
                 			 '[empty subsystem slot]']

				if str.lines.first =~ /^(\[).*(\])$/
					ship = str.lines.first.match(ammo_pattern)[1].tr('[]', '')
				 	fit_name = str.lines.first.match(ammo_pattern)[2].tr('[]', '')
				else
					raise "Invalid EFT title line"
				end
				matches, bad_lines = @Utils.regex_match_lines(ammo_pattern, str.lines[1..-1])
				matches2, bad_lines2 = @Utils.parse_listing(bad_lines)
				
				@bad_lines = bad_lines2
				
				module_w_ammo = Hash.new { |h, k| h[k] = 0 }
				matches.each do |m|
					module_w_ammo[m] += 1
				end

				modules = []
				module_w_ammo.sort.each do |(name, ammo), quantity|
					modules << { 'name'=> name.strip, 'ammo'=> ammo.strip, 'quantity'=> quantity}
					modules
				end

				matches2.each do |item|
					modules << item
				end

				@result = {'ship' => ship, 
						  'name' => fit_name, 
						  'modules' => modules.map { |i| i }
						}
			end
		end
	end
end