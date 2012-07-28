require "bcm2835/version"
require "bcm2835/native"
require "bcm2835/gpio"
require "bcm2835/spi"

# Provides access to library initialization and shutdown
module Bcm2835

  # Initialize the native library
  #
  # @return [Boolean] true if the library was opened successfully
  def init
    raise Errno::EACCES.new unless Native.init == 1
  end

  # Close the native library
  #
  # @return [Boolean] true if the library was closed successfully
  def close
    Native.close == 1
  end

  module_function :init, :close
end

at_exit { Bcm2835.close }
Bcm2835.init
