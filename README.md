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
    
Output the number of seconds in human readable form, rounding up to a minimum unit:

    >> HumanTime.output 53005, { :round_to => HumanTime::DAY }
    
Get the difference between two integer values of seconds:

    >> HumanTime.between 3600, 60
    => "59 minutes" 
 
 Get the difference between two Time or DateTime values:
 
    >> HumanTime.between Time.now, Time.now
    => "0 seconds" 
    
    >> t1 = Time.utc( 2011, 12, 1 )
    => 2011-12-01 00:00:00 UTC 
    >> t2 = Time.utc( 2011, 12, 8 )
    => 2011-12-08 00:00:00 UTC 
    >> HumanTime.between t1, t2
    => "1 week" 
    
    >> t1 = Time.now
    => 2012-04-03 11:35:22 +0100 
    >> t2 = Time.now + 3600
    => 2012-04-03 12:35:26 +0100 
    >> HumanTime.between t1, t2
    => "1 hour" 
    
You can also pass additional options to #output or #between.

To round up times:

    >> HumanTime.output 23
    => "23 seconds" 
    >> HumanTime.output 23, { :round_to => HumanTime::MINUTE }
    => "1 minute" 
    >> HumanTime.output 234
    => "3 minutes 54 seconds" 
    >> HumanTime.output 234, { :round_to => HumanTime::HOUR }
    => "1 hour" 
    >> HumanTime.output 53005
    => "14 hours 43 minutes" 
    >> HumanTime.output 53005, { :round_to => HumanTime::DAY }
    => "1 day" 
    >> HumanTime.output 530052
    => "6 days" 
    >> HumanTime.output 530052, { :round_to => HumanTime::WEEK }
    => "6 days" 
    >> HumanTime.output 1209600
    => "2 weeks" 
    >> HumanTime.output 1209600, { :round_to => HumanTime::MONTH }
    => "1 month" 
    >> HumanTime.output 5452302
    => "2 months" 
    >> HumanTime.output 5452302, { :round_to => HumanTime::YEAR }
    => "2 months"
    
    >> t1 = Time.now
    => 2012-04-03 11:35:22 +0100 
    >> t2 = Time.now + 3600
    => 2012-04-03 12:35:26 +0100 
    >> HumanTime.between t1, t2
    => "1 hour" 
    >> HumanTime.between t1, t2, { :round_to => HumanTime::DAY }
    => "1 day" 

To truncate everything except the greatest time denomination:

    >> HumanTime.output 234
    => "3 minutes 54 seconds" 
    >> HumanTime.output 234, { :round_to => HumanTime::GREATEST }
    => "3 minutes" 
    >> HumanTime.output 53005
    => "14 hours 43 minutes" 
    >> HumanTime.output 53005, { :round_to => HumanTime::GREATEST }
    => "14 hours" 
   
    
    >> t1 = Time.now
    => 2017-07-13 15:40:49 -0700 
    >> t2 = Time.now + 3700
    => 2017-07-13 16:42:29 -0700 
    >> HumanTime.between t1, t2
    => "1 hour 1 minute 40 seconds" 
    >> HumanTime.between t1, t2, { :round_to => HumanTime::GREATEST }
    => "1 hour" 
       
# Changelog

- 0.1.0: First release. [March 25, 2012]
- 0.2.0: Added HumanTime#between method. [April 3, 2012]
- 0.2.1: Changes to display "0 seconds" if you're passing two times that are the same to HumanTime#between. [April 3, 2012]
- 0.2.2: Added ability to pass an options hash containing :round_to to #between and #output. [April 3, 2012] 
- 0.3.0: Added support to :round_to the greatest denomination in #between and #output. [July 13, 2017]