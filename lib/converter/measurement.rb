# frozen_string_literal: true

require 'converter/units'
require 'converter/operations'
require 'converter/exceptions'

module Converter
  # Class Measurement adds new type to operate with units
  #
  # @author Mikhail Bobryshev <saintprog@gmail.com>
  #
  class Measurement
    include Converter::Units
    include Converter::Operations

    attr_accessor :unit, :value

    def initialize(value, unit)
      @value = value
      @unit = unit
    end

    def self.default_for(value, unit)
      unit_type = CONVERTER_UNITS[unit.to_sym][:type]
      new(value, Converter.send("default_#{unit_type}_unit"))
    end

    def self.available_units
      CONVERTER_UNITS.keys
    end

    def unit_type
      CONVERTER_UNITS[unit.to_sym][:type]
    end

    available_units.each do |define_unit|
      # Adds methods to convert from initial units to given
      #
      define_method "to_#{define_unit}" do
        if CONVERTER_UNITS[define_unit.to_sym][:type] != unit_type
          raise Converter::WrongConversionTypeError.new(unit, define_unit)
        end

        Measurement.new(
          value / CONVERTER_UNITS[define_unit.to_sym][:multiplier] * CONVERTER_UNITS[unit.to_sym][:multiplier],
          define_unit
        )
      end
    end

    def inspect
      if @value
        [@value, @unit].compact.map(&:to_s).join(' ')
      else
        super
      end
    end
  end
end
