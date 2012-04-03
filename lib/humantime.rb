class HumanTime
  
  SECOND = 1
  MINUTE = 60
  HOUR = 3600
  DAY = 86400
  MONTH = 2629743
  YEAR = 31556926
  
  # Parse an integer and return the string representation of a time
  def self.output int
    str = []
    display = ['years', 'months', 'days', 'hours', 'minutes', 'seconds']
    
    return "0 seconds" if int == 0
      
    # Years
    if int > ( YEAR - 1 ) && display.include?('years')
      years = int / YEAR
      int = int - ( years * YEAR )
      display.delete 'minutes' 
      display.delete 'seconds' 
      display.delete 'hours'
      
      if years.round == 1
        str << "#{years.round} year"
      else
        str << "#{years.round} years"
        display.delete('months')
      end
    end
        
    # Months
    if int < YEAR && int > ( MONTH - 1 ) && display.include?('months')
      months = int / MONTH
      int = int - ( months * MONTH )
      display.delete 'minutes'
      display.delete 'seconds'
      display.delete 'hours' 
      
      if months.round == 1
        str << "#{months.round} month"
      elsif months.round == 12
        str << "1 year"
      else
        str << "#{months.round} months"
        display.delete 'days'
      end
    end
        
    # Days
    if int < MONTH && int > ( DAY - 1 ) && display.include?('hours')
      days = int / DAY
      int = int - ( days * DAY )
      display.delete 'minutes' 
      display.delete 'seconds'
      
      if days.round == 1
        str << "#{days.round} day"
      else
        str << "#{days.round} days"
        display.delete 'hours'
      end
    end    
        
    # Hours
    if int < DAY && int > ( HOUR - 1 ) && display.include?('hours')
      hours = int / HOUR
      int = int - ( hours * HOUR )
      display.delete 'seconds'
      
      if hours.round == 1
        str << "#{hours.round} hour"
      else
        str << "#{hours.round} hours"
      end
    end
        
    # Minutes
    if int < HOUR && int > ( MINUTE - 1 ) && display.include?('minutes')
      mins = int / MINUTE
      int = int - ( mins * MINUTE )
      
      if mins.round == 1
        str << "#{mins.round} minute"
      else
        str << "#{mins.round} minutes"
      end
    end
        
    # Seconds
    if int < MINUTE && int > 0 && display.include?('seconds')
      if int.round == 1
        str << "#{int.round} second"
      else
        str << "#{int.round} seconds"
      end
    end
    
    str.join(' ') 
  end
  
  # Output the difference betwen two integer / DateTime / Time values
  def self.between start_time, end_time
    et = end_time.to_i
    st = start_time.to_i
    
    if et > st
      diff = et - st
    elsif st > et 
      diff = st - et
    else
      diff = 0
    end
    self.output diff
  end
    
  # From https://github.com/hpoydar/chronic_duration
  # For future parsing methods
  def mappings
    { 
      'seconds' => 'seconds',
      'second'  => 'seconds',
      'secs'    => 'seconds',
      'sec'     => 'seconds',
      's'       => 'seconds',
      'minutes' => 'minutes',
      'minute'  => 'minutes',
      'mins'    => 'minutes',
      'min'     => 'minutes',
      'm'       => 'minutes',
      'hours'   => 'hours',
      'hour'    => 'hours',
      'hrs'     => 'hours',
      'hr'      => 'hours',
      'h'       => 'hours',
      'days'    => 'days',
      'day'     => 'days',
      'dy'      => 'days',
      'd'       => 'days',
      'weeks'   => 'weeks',
      'week'    => 'weeks',
      'w'       => 'weeks',
      'months'  => 'months',
      'mos'     => 'months',
      'month'   => 'months',
      'years'   => 'years',
      'year'    => 'years',
      'yrs'     => 'years',
      'y'       => 'years'
    }
  end

end