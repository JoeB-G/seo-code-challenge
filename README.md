# Identity Records Validator

A Ruby application that processes and validates identity records from XML files, generating reports for both valid and invalid records and outputting
metrics to the terminal. Challenge of SEO SDET interview.

## Requirements

- Ruby 3.4.1 or higher
- Bundler

## Installation

1. Clone the repository
```bash
git clone [repository-url]
cd seo-code-challenge
```

2. Install Dependencies
bundle install

## Usage

To validate the records provided for the code challenge run
```bash
ruby bin/run
```

You can also specify any alternate records you would like to run the project against
```bash
ruby bin/run data/test_records.xml
```

## Output

The project will output two XML files to the output folder, timestamped one with valid records in the required format
the other with the invalid records, as they appeared in the original XML, but now with an errors node with details of
why they failed validation.

Details outputted to the terminal:
     - Number of valid/invalid records
     - Count of records with multiple first names
     - Count of records that failed identification validation
     - Count of records that failed time at address validation

## Tests

To run all tests 
```bash
rspec
```

To run specific tests
```bash
rspec spec/path/to/specific_test.rb
```

## Inputs

The input records should be in the following format:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<data>
  <people type="array">
    <person>
      <firstNames>hee</firstNames>
      <lastName>beatty</lastName>
      <dateOfBirth>1995-07-26</dateOfBirth>
      <address>
        <line1>8579 Elbert Mill Nicolaschester</line1>
        <buildingNumber>8579</buildingNumber>
        <streetName>Elbert Mill</streetName>
        <town>Nicolaschester</town>
           <postcode>BA96 3HL</postcode>
      </address>
      <yearsAtAddress type="integer">15</yearsAtAddress>
      <passportNumber>IJ834791</passportNumber>
      <nationalInsuranceNumber>31 72 15 52 52 31 25</nationalInsuranceNumber>
    </person>
  </people>
</data>
```