# frozen_string_literal: true

# Extend Numeric class with converter's instance methods
#
# @author Mikhail Bobryshev <saintprog@gmail.com>
#
class Numeric
  Converter::Measurement.available_units.each do |unit|
    # Adds methods to describe initial unit to convert from
    #
    define_method unit do
      Converter::Measurement.new(self, unit)
    end

    # Adds methods to convert from default units
    #
    define_method "to_#{unit}" do
      Converter::Measurement.default_for(self, unit).send("to_#{unit}")
    end
  end
end
