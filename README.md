# Converter

![Gem](https://img.shields.io/gem/v/converter)
![Downloads total](https://img.shields.io/gem/dt/converter)

This gem provides additional methods for `Numeric` values which enables conversion between different units.

## Getting started

### Installation

Add the gem to your `Gemfile`:

```ruby
gem 'converter'
```

and run:

```
bundle install
```

### Configuration

Configuration enables to set default units for different types of measurements
To configure gem add this block to your application boot file:

```ruby
Converter.config do |c|
  c.default_length_unit = 'meter'
  c.default_mass_unit = 'gram'
  c.default_area_unit = 'square_meter'
  c.default_volume_unit = 'milliliter'
end
```

## Usage

```ruby
# converts 10 inches to centimeters
10.inch.to_cm # => 25.4 cm

# uses default units that may be setted in configuration for conversion
# converts 15 meters to yards
15.to_yard
```

## License

Copyright (c) [Mikhail Bobryshev](https://github.com/saintprog). License type is [MIT](https://github.com/saintprog/converter/blob/master/LICENSE).
