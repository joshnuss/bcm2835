module Bcm2835
	module GPIO
		def direction(pin, mode)
			case mode
				when :input
					input(pin)
				when :output
					output(pin)
				else
					raise ArgumentError.new("Mode #{mode} is invalid. Use :input or :output")
			end
		end

		def input(pin)
		end

		def output(pin)
		end
	end
end
