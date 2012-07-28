module Bcm2835
  module SPI
    # 65536 = 256us = 4kHz
    CLOCK_DIVIDER_65536 = 0
    # 32768 = 126us = 8kHz
    CLOCK_DIVIDER_32768 = 32768
    # 16384 = 64us = 15.625kHz
    CLOCK_DIVIDER_16384 = 16384
    # 8192 = 32us = 31.25kHz
    CLOCK_DIVIDER_8192  = 8192
    # 4096 = 16us = 62.5kHz
    CLOCK_DIVIDER_4096  = 4096
    # 2048 = 8us = 125kHz
    CLOCK_DIVIDER_2048  = 2048
    # 1024 = 4us = 250kHz
    CLOCK_DIVIDER_1024  = 1024
    # 512 = 2us = 500kHz
    CLOCK_DIVIDER_512   = 512
    # 256 = 1us = 1MHz
    CLOCK_DIVIDER_256   = 256
    # 128 = 500ns = = 2MHz
    CLOCK_DIVIDER_128   = 128
    # 64 = 250ns = 4MHz
    CLOCK_DIVIDER_64    = 64
    # 32 = 125ns = 8MHz
    CLOCK_DIVIDER_32    = 32
    # 16 = 50ns = 20MHz
    CLOCK_DIVIDER_16    = 16

    # least signifigant bit first, e.g. 4 = 0b001
    LSBFIRST = 0
    # most signifigant bit first, e.g. 4 = 0b100
    MSBFIRST = 1

    # Chip Select 0
    CHIP_SELECT_0 = 0
    # Chip Select 1
    CHIP_SELECT_1 = 1
    # Chip Select 2 (ie pins CS1 and CS2 are asserted)
    CHIP_SELECT_2 = 2
    # No CS, control it yourself
    CHIP_SELECT_NONE = 3
=begin
+ SPI.bit_order(7..0)
+ SPI.bit_order(0..7)
+ SPI.begin
+ SPI.end
+ SPI.clock(SPI::PRESCALER_32678)
+ SPI.write(array_or_int)
  SPI.read(n=nil)
+ SPI.chip_select
+ SPI.chip_select_polarity(SPI::POLARITY_LOW)
  SPI.mode
=end
    def begin
      Native.spi_begin
    end

    def end
      Native.spi_end
    end

    def clock(divider)
      Native.spi_clock(divider)
    end

    def bit_order(order)
      if order.is_a?(Range)  
        if order.begin < order.end
          order = LSBFIRST
        else
          order = MSBFIRST
        end
      end

      Native.spi_bit_order(order)
    end

    def chip_select(chip=CHIP_SELECT_0)
      Native.spi_chip_select(chip) 
    end

    def chip_select_active_low(chip_select, low)
      Native.spi_chip_select_polarity(chip_select, low ? Native::LOW : Native::HIGH)
    end

    def read(count=nil)
      if count
        write([0xFF] * count)
      else
        Native.spi_transfer(0)
      end
    end

    def write(*args)
      case args.count
        when 0
          raise ArgumentError.new("missing arguments")
        when 1
          data = args.first
        else
          data = args
      end

      case data
      when Numeric
        Native.spi_transfer(data)
      when String
        data.each_byte.map {|byte| Native.spi_transfer(byte).chr }.join 
      when Enumerable
        data.map {|byte| Native.spi_transfer(byte) }
      else
        raise ArgumentError.new("#{data.class} is not valid data. User Numeric, String or an Enumerable of numbers")
      end
    end

    module_function :begin, :end, :read, :write, :clock, :bit_order, :chip_select, :chip_select_active_low
  end
end