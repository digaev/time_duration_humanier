require 'time_duration_humanizer/version'

class Numeric
  UNITS = {
    year: 315_576_00,
    month: 259_200_0,
    week: 604_800,
    day: 864_00,
    hour: 3600,
    minute: 60,
    second: 1
  }.freeze

  DEFAULTS = {
    and_at_end: true,
    days_in_year: 365.25,
    year: true,
    month: true,
    week: false,
    day: true,
    hour: true,
    minute: true,
    second: true
  }.freeze

  def to_duration(options = {})
    options = DEFAULTS.dup.merge!(options)
    units = to_duration_units(options).map { |v| t_duration_unit(v) }
    last = if units.length > 1 && options[:and_at_end] == true
             " #{I18n.t('time_duration_humanizer.and')} #{units.pop}"
           else
             ''
           end
    units.join(', ') + last
  end

  private

  def to_duration_units(options)
    units = []
    seconds = to_i

    UNITS.each do |k, v|
      next if options[k] != true

      secs = k == :year ? (options[:days_in_year] * UNITS[:day]).to_i : v
      value = seconds >= secs ? seconds / secs : 0
      if value > 0
        units << { name: k, value: value }
        seconds -= value * secs
      end
    end
    units
  end

  def t_duration_unit(unit)
    "#{unit[:value]} " + I18n.t(
      "time_duration_humanizer.#{unit[:name]}", count: unit[:value]
    )
  end
end
