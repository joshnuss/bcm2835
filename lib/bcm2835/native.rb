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
    
    attach_function :init,          :bcm2835_init,      [], :uint8
    attach_function :close,         :bcm2835_close,     [], :uint8

    attach_function :gpio_function, :bcm2835_gpio_fsel, [:uint8, :uint8], :void
    attach_function :gpio_set,      :bcm2835_gpio_set,  [:uint8], :void
    attach_function :gpio_clear,    :bcm2835_gpio_clr,  [:uint8], :void
    attach_function :gpio_level,    :bcm2835_gpio_lev,  [:uint8], :uint8

    attach_function :spi_begin,       :bcm2835_spi_begin,            [], :uint8
    attach_function :spi_end,         :bcm2835_spi_end,              [], :uint8
    attach_function :spi_transfer,    :bcm2835_spi_transfer,       [:uint8], :uint8
    attach_function :spi_clock,       :bcm2835_spi_setClockDivider,  [:uint8], :void
    attach_function :spi_bit_order,   :bcm2835_spi_setBitOrder,      [:uint8], :void
    attach_function :spi_chip_select, :bcm2835_spi_chipSelect,       [:uint8], :void
    attach_function :spi_chip_select_polarity, 
                    :bcm2835_spi_setChipSelectPolarity,              [:uint8, :uint8], :void
  end
end
