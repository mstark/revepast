require "revepast/version"

module Revepast
	module Parser
		autoload :Parser, 'revepast/parser'
	end

	class Sort
		autoload :EFT, 'revepast/parser/eft'
		include Revepast::Parser

		attr_reader :result, :bad_lines

		def initialize(str)
			parser_table = [ EFT.new(str) ]
			parser_table.each do |parser|
				begin
					parse = parser
					if parse then
						@result = parse.result
						@bad_lines = parse.bad_lines
					end
				rescue
					p "shit"
					0
				end
			end
		end
	end

	class Parse
		attr_reader :result
		def initialize (str)
			@result = Revepast::Sort.new(str)
			puts JSON.pretty_generate(result.result)
			puts result.bad_lines
		end
	end

end
