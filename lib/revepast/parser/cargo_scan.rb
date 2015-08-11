module Revepast
	module Parser
		class CargoScan
			def initialize(str)
			@Utils = Utils.new
			@str = @Utils.sanitize(str)
			parse
			end

			def parse
				p "wa are in CargoScan"
			end
		end
	end
end