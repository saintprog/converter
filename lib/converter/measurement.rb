module Converter
  class Measurement
    attr_accessor :unit, :value

    INCH_IN_MM = 25.4
    PINT_IN_ML = 569.6

    CONVERTER_UNITS = {
      mm: {multiplier: 1.0, type: 'length'},
      cm: {multiplier: 10.0, type: 'length'},
      dm: {multiplier: 100.0, type: 'length'},
      m: {multiplier: 1000.0, type: 'length'},
      km: {multiplier: 1e6, type: 'length'},

      inch: {multiplier: INCH_IN_MM, type: 'length'},
      foot: {multiplier: 12*INCH_IN_MM, type: 'length'},
      yard: {multiplier: 3*12*INCH_IN_MM, type: 'length'},
      mile: {multiplier: 1760*3*12*INCH_IN_MM, type: 'length'},

      cubic_mm: {multiplier: 1e-3, type: 'volume'},
      cubic_cm: {multiplier: 1.0, type: 'volume'},
      milliliter: {multiplier: 1.0, type: 'volume'},
      cubic_dm: {multiplier: 1e3, type: 'volume'},
      liter: {multiplier: 1e3, type: 'volume'},
      cubic_m: {multiplier: 1e6, type: 'volume'},
      cubic_km: {multiplier: 1e9, type: 'volume'},

      cubic_inch: {multiplier: (INCH_IN_MM)**3, type: 'volume'},
      cubic_foot: {multiplier: (12*INCH_IN_MM)**3, type: 'volume'},
      cubic_yard: {multiplier: (3*12*INCH_IN_MM)**3, type: 'volume'},
      cubic_mile: {multiplier: (1760*3*12*INCH_IN_MM)**3, type: 'volume'},

      fl_oz: {multiplier: PINT_IN_ML/20, type: 'volume'},
      gill: {multiplier: PINT_IN_ML/4, type: 'volume'},
      pint: {multiplier: PINT_IN_ML, type: 'volume'},
      quart: {multiplier: PINT_IN_ML*2, type: 'volume'},
      gallon: {multiplier: PINT_IN_ML*2*4, type: 'volume'},
    }

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
        return Measurement.new(self.value / CONVERTER_UNITS[unit.to_sym][:multiplier] * CONVERTER_UNITS[self.unit.to_sym][:multiplier], unit)
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
end
