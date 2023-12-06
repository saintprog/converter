# frozen_string_literal: true

module Converter
  module Units
    INCH_IN_MM = 25.4

    PERCH_IN_SQM = 25.29285

    PINT_IN_ML = 569.6

    POUND_IN_GRAMS = 453.59237

    CONVERTER_UNITS = {
      mm:            {multiplier: 1.0,                        type: 'length'},
      cm:            {multiplier: 10.0,                       type: 'length'},
      dm:            {multiplier: 100.0,                      type: 'length'},
      meter:         {multiplier: 1000.0,                     type: 'length'},
      km:            {multiplier: 1e6,                        type: 'length'},
      inch:          {multiplier: INCH_IN_MM,                 type: 'length'},
      foot:          {multiplier: 12*INCH_IN_MM,              type: 'length'},
      yard:          {multiplier: 3*12*INCH_IN_MM,            type: 'length'},
      mile:          {multiplier: 1760*3*12*INCH_IN_MM,       type: 'length'},

      cubic_mm:      {multiplier: 1e-3,                       type: 'volume'},
      cubic_cm:      {multiplier: 1.0,                        type: 'volume'},
      milliliter:    {multiplier: 1.0,                        type: 'volume'},
      cubic_dm:      {multiplier: 1e3,                        type: 'volume'},
      liter:         {multiplier: 1e3,                        type: 'volume'},
      cubic_m:       {multiplier: 1e6,                        type: 'volume'},
      cubic_km:      {multiplier: 1e9,                        type: 'volume'},
      cubic_inch:    {multiplier: INCH_IN_MM**3,              type: 'volume'},
      cubic_foot:    {multiplier: (12*INCH_IN_MM)**3,         type: 'volume'},
      cubic_yard:    {multiplier: (3*12*INCH_IN_MM)**3,       type: 'volume'},
      cubic_mile:    {multiplier: (1760*3*12*INCH_IN_MM)**3,  type: 'volume'},

      fl_oz:         {multiplier: PINT_IN_ML/20,              type: 'volume'},
      gill:          {multiplier: PINT_IN_ML/4,               type: 'volume'},
      pint:          {multiplier: PINT_IN_ML,                 type: 'volume'},
      quart:         {multiplier: PINT_IN_ML*2,               type: 'volume'},
      gallon:        {multiplier: PINT_IN_ML*2*4,             type: 'volume'},

      square_mm:     {multiplier: 1.0,                        type: 'area'},
      square_cm:     {multiplier: 1e2,                        type: 'area'},
      square_dm:     {multiplier: 1e4,                        type: 'area'},
      square_m:      {multiplier: 1e6,                        type: 'area'},
      hectare:       {multiplier: 1e10,                       type: 'area'},
      square_km:     {multiplier: 1e12,                       type: 'area'},

      square_inch:   {multiplier: INCH_IN_MM**2,              type: 'area'},
      square_foot:   {multiplier: (12*INCH_IN_MM)**2,         type: 'area'},
      square_yard:   {multiplier: (3*12*INCH_IN_MM)**2,       type: 'area'},
      square_mile:   {multiplier: (1760*3*12*INCH_IN_MM)**2,  type: 'area'},

      perch:         {multiplier: PERCH_IN_SQM*1e6,           type: 'area'},
      rood:          {multiplier: 40*PERCH_IN_SQM*1e6,        type: 'area'},
      acre:          {multiplier: 4*40*PERCH_IN_SQM*1e6,      type: 'area'},

      mg:            {multiplier: 1e-3,                       type: 'mass'},
      gram:          {multiplier: 1.0,                        type: 'mass'},
      kg:            {multiplier: 1e3,                        type: 'mass'},
      tonne:         {multiplier: 1e6,                        type: 'mass'},

      grain:         {multiplier: POUND_IN_GRAMS/7000,        type: 'mass'},
      drachm:        {multiplier: POUND_IN_GRAMS/256,         type: 'mass'},
      ounce:         {multiplier: POUND_IN_GRAMS/16,          type: 'mass'},
      pound:         {multiplier: POUND_IN_GRAMS,             type: 'mass'},
      stone:         {multiplier: POUND_IN_GRAMS*14,          type: 'mass'},
      quarter:       {multiplier: POUND_IN_GRAMS*28,          type: 'mass'},
      hundredweight: {multiplier: POUND_IN_GRAMS*112,         type: 'mass'},
      ton:           {multiplier: POUND_IN_GRAMS*2240,        type: 'mass'}
    }.freeze
  end
end
