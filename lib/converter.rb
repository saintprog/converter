module Converter
  class << self
    attr_writer :default_length_unit, :default_mass_unit, :default_volume_unit, :default_area_unit

    def default_length_unit
      @default_length_unit || 'm'
    end

    def default_mass_unit
      @default_mass_unit || 'gram'
    end

    def default_volume_unit
      @default_volume_unit || 'cubic_meter'
    end

    def default_area_unit
      @default_area_unit || 'square_meter'
    end

    def config
      yield self
    end
  end
end

require 'converter/measurement'
require 'converter/core_ext/numeric'
