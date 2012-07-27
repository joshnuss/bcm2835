# Ruby Bindings for [libbcm2835](http://www.open.com.au/mikem/bcm2835/)

The BCM2835 is the ARM11 core used in the Raspberry PI. It exposes several harware peripherals:

- [GPIO](http://en.wikipedia.org/wiki/GPIO) (General Purpose Input/Output) 
- [SPI](http://en.wikipedia.org/wiki/Serial_Peripheral_Interface_Bus) (Serial Peripheral Interface)
- [I²C](http://en.wikipedia.org/wiki/I²C) (Two Wire Interface)
- [UART](http://en.wikipedia.org/wiki/UART) (Universal Asynchronous Receiver/Transmitter)

This library is a wrapper on top of [libbcm2835](http://www.open.com.au/mikem/bcm2835/) that provides a high level interace for accessing the ARM's hardware features

## GPIO 

### Using Inputs
```ruby
pin = 17

# make pin an input
GPIO.input(pin)

# check if the input is HIGH
puts "pressed" if GPIO[pin]
```

### Using Outputs
```ruby
pin = 17

# make pin an output
GPIO.output(pin)

# blink
loop do
  GPIO[pin] = true
  sleep(1)
  GPIO[pin] = false
  sleep(1)
end
```



## Installation

Add this line to your application's Gemfile:

    gem 'bcm2835'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bcm2835

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
