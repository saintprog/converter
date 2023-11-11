class Numeric
  Converter::Measurement.available_units.each do |unit|
    define_method unit do
      Converter::Measurement.new(self, unit)
    end

    # converts value directly using default settings
    define_method "to_#{unit}" do
      Converter::Measurement.default_for(self, unit).send("to_#{unit}")
    end
  end
end
