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
				result = parse(str)
			end

			def parse(str)
		    	ammo_pattern = /^([\S ]+), ?([\S ]+)$/
				blacklist = ['[empty high slot]',
                 			 '[empty low slot]',
                			 '[empty medium slot]',
                			 '[empty rig slot]',
                 			 '[empty subsystem slot]']

                 sanitize = @Utils.sanitize(str)
                 lines = []
                 sanitize.each do |line|
                 	unless blacklist.include? line.downcase
                 		lines << line
                 	end
                 end

				begin 
					lines.first =~ /^(\[).*(\])$/
					ship = lines.first.match(ammo_pattern)[1].tr('[]', '')
				 	fit_name = lines.first.match(ammo_pattern)[2].tr('[]', '')
				rescue
					$stderr.print "Invalid EFT title line = " + lines.first
					raise
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