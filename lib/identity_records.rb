# frozen_string_literal: true

require 'nokogiri'
require 'date'
require 'time'
require 'capitalize_names'

# Require all validators
require_relative 'identity_records/validation/validators/name'
require_relative 'identity_records/validation/validators/age'
require_relative 'identity_records/validation/validators/address'
require_relative 'identity_records/validation/validators/years_at_address'
require_relative 'identity_records/validation/validators/identification'
require_relative 'identity_records/validation/record'

# Require all models
require_relative 'identity_records/models/address'
require_relative 'identity_records/models/identity_record'

# Require processors and reporters
require_relative 'identity_records/readers/xml_processor'
require_relative 'identity_records/reporters/validation_reporter'
require_relative 'identity_records/reporters/reports/invalid_records_xml_generator'
require_relative 'identity_records/reporters/reports/valid_records_xml_generator'
require_relative 'identity_records/reporters/reports/metrics_reporter'
