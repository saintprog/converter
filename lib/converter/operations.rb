# frozen_string_literal: true

module Converter
  # Module Operations provides basic arithmetic operations for measurements
  #
  # @author Mikhail Bobryshev <saintprog@gmail.com>
  #
  module Operations
    def +(other)
      check_units(other)
      (value + other.send("to_#{unit}").value).send(unit)
    end

    def -(other)
      check_units(other)
      (value - other.send("to_#{unit}").value).send(unit)
    end

    def ==(other)
      return false unless other.is_a? Converter::Measurement
      return false if unit != other.unit
      return false if value != other.value

      true
    end

    # For next operations we have to change unit type
    # e.g.: length * length should produce area
    def *(other)
      raise NotImplementedError
    end

    def /(other)
      raise NotImplementedError
    end

    def check_units(operand)
      raise TypeError, "Can't operate with #{operand.class}" unless operand.is_a? Converter::Measurement
      raise Converter::IncompatibleUnitsError.new(unit, operand.unit) unless unit_type == operand.unit_type
    end
  end
end
