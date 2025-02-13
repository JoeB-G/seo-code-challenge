#!/usr/bin/env ruby

require 'fileutils'
require_relative '../lib/identity_records'

default_xml = File.expand_path('../data/records.xml', __dir__)
xml_file = ARGV[0] || default_xml
xml_content = File.read(xml_file)
valid_people, invalid_people = IdentityRecords::XmlProcessor.process(xml_content)
IdentityRecords::Reporters::ValidationReporter.new.report(valid_people, invalid_people)
