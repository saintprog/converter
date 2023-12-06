# frozen_string_literal: true

module Converter
  # Exception to raise when try to convert between different unit types
  #
  class WrongConversionTypeError < StandardError
    def initialize(unit_from, unit_to)
      msg = format("Can't convert %<from_unit>s (%<from_type>s unit) to %<to_unit>s (%<to_type>s unit)",
                   from_unit: unit_from.to_sym,
                   from_type: Converter::Measurement::CONVERTER_UNITS[unit_from.to_sym][:type],
                   to_unit: unit_to.to_sym,
                   to_type: Converter::Measurement::CONVERTER_UNITS[unit_to.to_sym][:type])
      super(msg)
    end
  end

  # Exception to raise when try to operate with different unit types
  #
  class IncompatibleUnitsError < StandardError
    def initialize(unit_first, unit_second)
      msg = format("Can't operate with different unit types:
                    %<first_unit>s (%<first_type>s unit) and %<second_unit>s (%<second_type>s unit)",
                   first_unit: unit_first.to_sym,
                   first_type: Converter::Measurement::CONVERTER_UNITS[unit_first.to_sym][:type],
                   second_unit: unit_second.to_sym,
                   second_type: Converter::Measurement::CONVERTER_UNITS[unit_second.to_sym][:type])
      super(msg)
    end
  end
end
