# frozen_string_literal: true

require 'converter'

describe Numeric do
  describe 'general usage' do
    it 'should create instance of Converter::Measurement' do
      expect(10.inch).to be_a Converter::Measurement
    end

    it 'should use proper unit' do
      expect(10.inch.unit).to eq :inch
    end

    it 'should have proper value' do
      expect(123.inch.value).to eq 123
    end
  end

  describe 'direct conversion' do
    it 'should be an instance of Converter::Measurement' do
      expect(10.inch.to_cm).to be_a Converter::Measurement
    end

    it 'should convert to a proper unit' do
      expect(10.inch.to_cm.unit).to eq :cm
    end

    it 'converts inches to cm' do
      expect(10.inch.to_cm.value).to eq(10 * Converter::Measurement::INCH_IN_MM / 10)
    end

    it 'should raise an exception when use different types' do
      expect { 10.inch.to_liter }.to raise_error(Converter::WrongConversionTypeError)
    end

    it 'should raise an exception when use unknown unit' do
      expect { 10.inch.to_appleseeds }.to raise_error(NoMethodError)
    end
  end

  describe 'conversion using default units' do
    it 'should be an instance of Converter::Measurement' do
      expect(10.to_cm).to be_a Converter::Measurement
    end

    it 'should convert to a proper unit' do
      expect(10.to_yard.unit).to eq :yard
    end

    it 'converts meters to yard' do
      expect(10.to_yard.value.round(2)).to eq(10.94)
    end
  end
end
