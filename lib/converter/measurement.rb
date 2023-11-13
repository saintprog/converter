require 'converter/units'

module Converter
  class Measurement
    include Converter::Units

    attr_accessor :unit, :value

    def initialize(value, unit)
      @value = value
      @unit = unit
    end

    def self.default_for(value, unit)
      unit_type = CONVERTER_UNITS[unit.to_sym][:type]
      self.new(value, Converter.send("default_#{unit_type}_unit"))
    end

    def self.available_units
      CONVERTER_UNITS.keys
    end

    available_units.each do |unit|
      define_method "to_#{unit}" do
        if CONVERTER_UNITS[unit.to_sym][:type] != CONVERTER_UNITS[self.unit.to_sym][:type]
          raise Converter::WrongConversionTypeError.new(self.unit, unit)
        else
          return Measurement.new(self.value / CONVERTER_UNITS[unit.to_sym][:multiplier] * CONVERTER_UNITS[self.unit.to_sym][:multiplier], unit)
        end
      end
    end

    def inspect
      if @value
        [@value, @unit].compact.map(&:to_s).join(" ")
      else
        super
      end
    end
  end

  class WrongConversionTypeError < StandardError
    def initialize(unit_from, unit_to)
      msg = "Can't convert #{unit_from.to_sym} (#{Converter::Measurement::CONVERTER_UNITS[unit_from.to_sym][:type]} unit) to #{unit_to.to_sym} (#{Converter::Measurement::CONVERTER_UNITS[unit_to.to_sym][:type]} unit)"
      super(msg)
    end
  end
end
