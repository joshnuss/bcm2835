# Ruby Bindings for [libbcm2835](http://www.open.com.au/mikem/bcm2835/)

The BCM2835 is the ARM11 core used in the Raspberry PI. It exposes several harware peripherals:

- [GPIO](#gpio)
- [SPI](#spi)
- [I²C](#i%C2%B2c)
- [UART](#uart)

This library is a wrapper on top of [libbcm2835](http://www.open.com.au/mikem/bcm2835/) that provides a high level interface for accessing the ARM's hardware features from Ruby

**[View the Full Documentation on rubydoc.info](http://rubydoc.info/github/joshnuss/bcm2835/master/frames)**

## GPIO 

[General Purpose Input/Output](http://en.wikipedia.org/wiki/GPIO) 

### Using Inputs
```ruby
pin = 17

# make pin an input
GPIO.input(pin)

# check if the input is HIGH i.e. true
puts "door is closed" if GPIO[pin]
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
## SPI

[Serial Peripheral Interface](http://en.wikipedia.org/wiki/Serial_Peripheral_Interface_Bus)

### Reading from the SPI bus
```ruby
SPI.begin do |spi| 
  puts spi.read       # returns 1 byte
  puts spi.read(1024) # returns an array of 1024 bytes 
end
```

### Writing to the SPI bus
```ruby
SPI.begin do |spi| 
  spi.write(0x22)           # write 1 byte
  spi.write("hello")        # write 5 bytes
  spi.write(0x22,0x45,0x71) # write several bytes at once 
end
```

## I²C

[Two Wire Interface](http://en.wikipedia.org/wiki/I²C)

Not yet implemented

## UART

[Universal Asynchronous Receiver/Transmitter](http://en.wikipedia.org/wiki/UART) 

You can use the Ruby Standard Library to read and write from the UART

### Echo Example
```ruby
File.open('/dev/ttyAMA0', 'a+') do |file|
  loop do 
    data = file.read
    file.puts(data)
  end
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
