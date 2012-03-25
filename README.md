Gem to return human readable times.

#### Usage

Output a number of seconds in human readable form:

    >> HumanTime.output 1
    => "1 second"
    >> HumanTime.output 45
    => "45 seconds"
    >> HumanTime.output 70
    => "1 minute 10 seconds"
    >> HumanTime.output 234
    => "3 minutes 54 seconds"
    >> HumanTime.output 53005
    => "14 hours 43 minutes"
    >> HumanTime.output 530052
    => "6 days"
    >> HumanTime.output 1209600
    => "14 days"
    >> HumanTime.output 5452302
    => "2 months"