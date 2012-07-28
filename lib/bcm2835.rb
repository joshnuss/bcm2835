require "bcm2835/version"
require "bcm2835/native"
require "bcm2835/gpio"
require "bcm2835/spi"

module Bcm2835
  def init
    raise Errno::EACCES.new unless Native.init == 1
  end

  def close
    Native.close == 1
  end

  module_function :init, :close
end

at_exit { Bcm2835.close }
Bcm2835.init
