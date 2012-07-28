module Bcm2835
  # Provides access to the CPU's General Purpose I/Os
  module GPIO

    # Configures the direction of a pin as either an input or an output
    #
    # @example
    #   button_pin = 17
    #   led_pin = 16
    #
    #   GPIO.direction(button_pin, :input)
    #   GPIO.direction(led_pin,    :output)
    #
    # @param [Number] pin the id of the pin
    # @param [Symbol] mode the direction of the pin, either :input or :output
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

    # Configures a pin as input
    #
    # @example
    #   pin = 17
    #   GPIO.input(pin)
    #
    # @param [Number] pin the id of the pin
    def input(pin)
      Native.gpio_function(pin, Native::GPIO_FSEL_INPT)
    end

    # Configures a pin as output
    #
    # @example
    #   pin = 17
    #   GPIO.output(pin)
    #
    # @param [Number] pin the id of the pin
    def output(pin)
      Native.gpio_function(pin, Native::GPIO_FSEL_OUTP)
    end

    # Sets an output pin to HIGH
    #
    # @example
    #   pin = 17
    #
    #   GPIO.output(pin)
    #   GPIO.set(pin) # make pin HIGH
    #
    # @param [Number] pin the id of the pin
    def set(pin)
      Native.gpio_set(pin)
    end

    # Clears an output pin to LOW
    #
    # @example
    #   pin = 17
    #
    #   GPIO.output(pin)
    #   GPIO.clear(pin) # make pin LOW
    #
    # @param [Number] pin the id of the pin
    def clear(pin)
      Native.gpio_clear(pin)
    end

    # Sets or clears an output pin 
    #
    # @example Using indexer (preferred)
    #   pin = 17
    #
    #   GPIO.output(pin)
    #   GPIO.[pin] = true  # make pin HIGH
    #   GPIO.[pin] = false # make pin LOW
    #
    # @example Using write
    #   pin = 17
    #
    #   GPIO.output(pin)
    #   GPIO.write(pin, true)  # make pin HIGH
    #   GPIO.write(pin, false) # make pin LOW
    #
    # @param [Number] pin the id of the pin
    # @param [Boolean] value true sets the pin HIGH, false sets the pin LOW
    def write(pin, value)
      value ? set(pin) : clear(pin)
    end

    alias :[]= :write

    # Reads an input pin 
    #
    # @example Using indexer (preferred)
    #   pin = 17
    #
    #   GPIO.input(pin)
    #   puts GPIO[pin]
    #
    # @example Using read
    #   pin = 17
    #
    #   GPIO.input(pin)
    #   puts GPIO.read(pin)
    #
    # @param [Number] pin the id of the pin
    # @return [Boolean] true if the pin is HIGH, false if the pin is LOW
    def read(pin)
      Native.gpio_level(pin) == Native::HIGH
    end

    alias :[] :read

    module_function :direction, :input, :output, :set, :clear, :read, :write, :[], :[]=
  end
end
