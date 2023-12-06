# frozen_string_literal: true

require 'converter'

describe Converter::Measurement do
  describe 'ariphmetical operations' do
    it 'should compare measurements' do
      expect(10.inch == 10.inch).to be true

      expect(10.inch == 10.cm).to be false
      expect(10.inch == 15.inch).to be false
    end

    it 'should sum 2 values of same unit' do
      expect(10.inch + 10.inch).to be_a Converter::Measurement

      expect(10.inch + 10.inch).to eq 20.inch
    end

    it 'should subtract 2 values of same unit' do
      expect(10.inch - 5.inch).to be_a Converter::Measurement

      expect(10.inch - 5.inch).to eq 5.inch
    end

    it 'should raise error for not implemented yet operations' do
      expect { 10.inch * 5.inch }.to raise_error(NotImplementedError)

      expect { 10.inch / 5.inch }.to raise_error(NotImplementedError)
    end

    it 'should not sum 2 values of different unit' do
      expect { 10.inch + 10 }.to raise_error(TypeError)

      expect { 10.inch + 10.liter }.to raise_error(Converter::IncompatibleUnitsError)
    end
  end
end
