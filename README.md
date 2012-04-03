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
    
Get the difference between two integer values of seconds:

    >> HumanTime.between 3600, 60
    => "59 minutes" 
 
 Get the difference between two Time or DateTime values:
 
    >> HumanTime.between Time.now, Time.now
    => "0 seconds" 

    >> t1 = Time.now
    => 2012-04-03 11:35:22 +0100 
    >> t2 = Time.now + 3600
    => 2012-04-03 12:35:26 +0100 
    >> HumanTime.between t1, t2
    => "1 hour" 