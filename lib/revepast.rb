require "revepast/version"

module Revepast
	class Error < StandardError
	end

	module Parser
		autoload :Parser, 'revepast/parser'
	end

	class Sort
		autoload :EFT, 'revepast/parser/eft'
		include Revepast::Parser

		attr_reader :result, :bad_lines

		def initialize(str)
			eft_parse = EFT.new(str)
			@result = eft_parse.result
			@bad_lines = eft_parse.bad_lines
		end
	end

	class Parse
		attr_reader :result
		def initialize (str)
			@result = Revepast::Sort.new(str)
			p result.result
			p result.bad_lines
		end
	end

end
