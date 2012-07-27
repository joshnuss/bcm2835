require 'ffi'

module Bcm2835
	module Native
		extend FFI::Library
		ffi_lib '/usr/local/lib/libbcm2835.so'
		
		attach_function :bcm2835_init, [], :int
		attach_function :bcm2835_close, [], :int
	end
end
