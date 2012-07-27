require 'ffi'

module Bcm2835
  module Native
    extend FFI::Library
    ffi_lib '/usr/local/lib/libbcm2835.so'

    GPIO_FSEL_INPT = 0b000
    GPIO_FSEL_OUTP = 0b001
    GPIO_FSEL_ALT0 = 0b100
    GPIO_FSEL_ALT1 = 0b101
    GPIO_FSEL_ALT2 = 0b110
    GPIO_FSEL_ALT3 = 0b111
    GPIO_FSEL_ALT4 = 0b011
    GPIO_FSEL_ALT5 = 0b010
    GPIO_FSEL_MASK = 0b111

    LOW  = 0
    HIGH = 1
    
    attach_function :bcm2835_init, [], :int
    attach_function :bcm2835_close, [], :int
    attach_function :bcm2835_gpio_fsel, [:int, :int], :void
    attach_function :bcm2835_gpio_set, [:int], :void
    attach_function :bcm2835_gpio_clr, [:int], :void
    attach_function :bcm2835_gpio_lev, [:int], :int
  end
end
