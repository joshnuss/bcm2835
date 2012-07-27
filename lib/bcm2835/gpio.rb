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
			Native.bcm2835_gpio_fsel(pin, Native::GPIO_FSEL_INPT)
		end

		def output(pin)
			Native.bcm2835_gpio_fsel(pin, Native::GPIO_FSEL_OUTP)
		end

		def set(pin)
			Native.bcm2835_gpio_set(pin)
		end

		def clear(pin)
			Native.bcm2835_gpio_clr(pin)
		end

		def read(pin)
			Native.bcm2835_gpio_lev(pin) == Native::HIGH
		end

		alias :[] :read

		def []=(pin, value)
			value ? set(pin) : clear(pin)
		end

		module_function :direction, :input, :output, :set, :clear, :read, :[], :[]=
	end
end
