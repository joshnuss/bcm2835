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
      Native.gpio_function(pin, Native::GPIO_FSEL_INPT)
    end

    def output(pin)
      Native.gpio_function(pin, Native::GPIO_FSEL_OUTP)
    end

    def set(pin)
      Native.gpio_set(pin)
    end

    def clear(pin)
      Native.gpio_clear(pin)
    end

    def write(pin, value)
      value ? set(pin) : clear(pin)
    end

    alias :[]= :write

    def read(pin)
      Native.gpio_level(pin) == Native::HIGH
    end

    alias :[] :read

    def []=(pin, value)
      value ? set(pin) : clear(pin)
    end

    module_function :direction, :input, :output, :set, :clear, :read, :write, :[], :[]=
  end
end
