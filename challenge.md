**385459**

**Software Development Engineer in Test (SDET)**

**Candidate Brief**

**Overview of the Exercise**

In this exercise you are required to present your solution to the panel.

You will be required to deliver your findings to the panel orally and by Screen Share.

&nbsp;

**Background Information**

A new identity service is in development and the team need to determine the state of existing data which is to be migrated to the new service.

The provided XML file contains a sample of identity records, which need to be parsed, validated and stored in the correct format.

An identity record contains the following fields:

- firstNames, lastName, dateOfBirth, address, yearsAtAddress, passportNumber, nationalInsuranceNumber

**Validation Rules**

With the new service, the following validation rules are applied:

<table><tbody><tr><th><p><strong>Field</strong></p></th><th><p><strong>Required</strong></p></th><th><p><strong>Additional Rules</strong></p></th></tr><tr><td><p>firstNames</p></td><td><p>Yes</p></td><td><p>45-character limit</p><p>Must contain only alphabetic characters with the following special characters allowed</p><ul><li>Apostrophe</li><li>Hyphen</li><li>Whitespace</li></ul></td></tr><tr><td><p>lastName</p></td><td><p>Yes</p></td><td><p>45-character limit</p><p>Must contain only alphabetic characters with the following special characters allowed:</p><ul><li>Apostrophe</li><li>Hyphen</li><li>Whitespace</li></ul></td></tr><tr><td><p>dateOfBirth</p></td><td><p>Yes</p></td><td><p>A person cannot be younger than 18 years old</p></td></tr><tr><td><p>address</p></td><td><p>Yes</p></td><td><p>Must either have</p><ul><li>line1</li><li>postcode</li></ul><p>OR</p><ul><li>buildingNumber</li><li>streetName</li><li>town</li><li>postcode</li></ul></td></tr><tr><td><p>yearsAtAddress</p></td><td><p>Yes</p></td><td><p>A person must have lived at their address for at least 5 years</p></td></tr><tr><td><p>passportNumber</p></td><td><p>Yes, if nationalInsuranceNumber is absent, optional otherwise</p></td><td><p>-</p></td></tr><tr><td><p>nationalInsuranceNumber</p></td><td><p>Yes, if passportNumber is absent, optional otherwise</p></td><td><p>-</p></td></tr></tbody></table>

**Format**

A valid record will be stored in the following format:

<table><tbody><tr><th><p><strong>Field</strong></p></th><th><p><strong>Format Rules</strong></p></th></tr><tr><td><p>firstNames</p></td><td><p>Title Case e.g., Foo Bar, O’Malley</p></td></tr><tr><td><p>lastNames</p></td><td><p>Title Case e.g., Foo Bar, O’Malley</p></td></tr><tr><td><p>dateOfBirth</p></td><td><p>01, Mar, 1990</p><ul><li>Zero-padded day</li><li>Abbreviated month</li><li>Year with century</li><li>Comma separated</li></ul></td></tr><tr><td><p>Address</p></td><td><p>Must only contain line1 and postcode</p><p>Line1 can be determined by joining buildingNumber, streetName and town separated by whitespace.</p><p>e.g.,</p><p>buildingNumber: 123</p><p>streetName: foo</p><p>town: bar</p><p>line1: 123 foo bar</p></td></tr><tr><td><p>yearsAtAddress</p></td><td><p>Integer</p></td></tr><tr><td><p>passportNumber</p></td><td><p>Uppercase</p></td></tr><tr><td><p>nationalInsuranceNumber</p></td><td><p>-</p></td></tr></tbody></table>

**Task**

&nbsp;

You will need to author code which performs the following functions:

1. Parse the data file and determine how many valid and invalid records the file contains.
    1. For invalid records, the reasons why they are invalid should be present. e.g fieldA is too short.
2. For the valid records, output their data in the correct format to either terminal or file.
3. Provide the following metrics:
    1. How many people have no passport number and no national insurance number?
    2. How many people have lived at their address for less than five years?
    3. How many people have more than two words in their first name?

You may use **any** reasonable general-purpose programming language to implement your solution. (Your audience will be unlikely to understand deliberately esoteric and obfuscatory toy languages, e.g., Malbolge.)

&nbsp;

The code is expected to compile and run successfully. You may use third-party libraries to assist you, but the implementation of task must be original.

&nbsp;

You **do not** have to implement testing for this code, **but** you should consider how you might test it since you may be asked about it.

&nbsp;

**You must submit your solution by the 13<sup>th</sup> February.** Please provide a link to a public source code repository such as GitHub to [ITSRecruitment@dvla.gov.uk](mailto:ITSRecruitment@dvla.gov.uk)

&nbsp;

&nbsp;

**Code Walk Through**

During the interview you will be asked to share your screen and walk the panel through your code. During this you **should** cover:

- A working demo of your code against the task
- A general overview of how your code
- Aspects of the task you enjoyed
- Aspects of the task you found difficult
- Aspects of your code you would like to improve or change

Your talk **should not** cover:

- A line-by-line explanation of the code