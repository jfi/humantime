class HumanTime
  
  SECOND = 1
  MINUTE = 60
  HOUR = 3600
  DAY = 86400
  WEEK = 604800
  MONTH = 2629743
  YEAR = 31556926

  GREATEST = -1
  
  # Parse an integer and return the string representation of a time
  def self.output int, options = {}
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
      if options[:round_to] == GREATEST
        display = display.slice 0..display.index('years')
      end
      
      if years.round == 1
        str << "#{years.round} year"
      else
        str << "#{years.round} years"
        display.delete('months')
      end
    end
        
    # Months
    if ( int < YEAR && int > ( MONTH - 1 ) && display.include?('months') ) || options[:round_to] == MONTH
      months = int / MONTH
      int = int - ( months * MONTH )
      display.delete 'minutes'
      display.delete 'seconds'
      display.delete 'hours'
      if options[:round_to] == GREATEST
        display = display.slice 0..display.index('months')
      end
      
      if options[:round_to] == MONTH
        months = months.round + 1
        int = 0
      end
      
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
    if ( int < MONTH && int > ( DAY - 1 ) && display.include?('hours')) || options[:round_to] == DAY
      days = int / DAY
      int = int - ( days * DAY )
      display.delete 'minutes' 
      display.delete 'seconds'
      if options[:round_to] == GREATEST
        display = display.slice 0..display.index('days')
      end

      if options[:round_to] == DAY
        days = days.round + 1
        int = 0
      end
      
      if days.round == 1
        str << "#{days.round} day"
      else
        # Display weeks, because we're cool like that
        if days.round % 7 == 0
          weeks = days.round / 7
          if weeks == 1
            str << "1 week"
          else
            str << "#{weeks} weeks"
          end
        else
          str << "#{days.round} days"
        end
        display.delete 'hours'
      end
    end    
        
    # Hours
    if ( int < DAY && int > ( HOUR - 1 ) && display.include?('hours') ) || options[:round_to] == HOUR
      hours = int / HOUR
      int = int - ( hours * HOUR )
      display.delete 'seconds'
      if options[:round_to] == GREATEST
        display = display.slice 0..display.index('hours')
      end
      
      if options[:round_to] == HOUR
        hours = hours.round + 1
        int = 0
      end
      
      if hours == 1
        str << "#{hours} hour"
      else
        str << "#{hours} hours"
      end
    end
        
    # Minutes
    if ( int < HOUR && int > ( MINUTE - 1 ) && display.include?('minutes') ) || options[:round_to] == MINUTE
      mins = int / MINUTE
      int = int - ( mins * MINUTE )
      if options[:round_to] == GREATEST
        display = display.slice 0..display.index('minutes')
      end
      
      if options[:round_to] == MINUTE
        mins = mins.round + 1
        int = 0
      end
      
      if mins == 1
        str << "#{mins} minute"
      else
        str << "#{mins} minutes"
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
  def self.between start_time, end_time, options = {}
    et = end_time.to_i
    st = start_time.to_i
    
    if et > st
      diff = et - st
    elsif st > et 
      diff = st - et
    else
      diff = 0
    end
    self.output diff, options
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
