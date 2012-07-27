require "bcm2835/version"
require "bcm2835/native"
require "bcm2835/gpio"

module Bcm2835
  def init
    raise Errno::EACCES.new unless Native.bcm2835_init == 1
  end

  def close
    Native.bcm2835_close == 1
  end

  module_function :init, :close
end

at_exit { Bcm2835.close }
Bcm2835.init
