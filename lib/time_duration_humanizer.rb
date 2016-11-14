require 'time_duration_humanizer/version'

module TimeDurationHumanizer
  DAYS_IN_YEAR = 365.25
  UNITS = {
    year: 315_576_00,
    month: 259_200_0,
    week: 604_800,
    day: 864_00,
    hour: 3600,
    minute: 60,
    second: 1
  }.freeze

  def self.humanize(seconds, options = {}, units = {})
    options = { and_at_end: true, days_in_year: DAYS_IN_YEAR }.merge!(options)
    units = {
      year: true, month: true, week: false, day: true,
      hour: true, minute: true, second: true
    }.merge!(units)

    values = []
    duration = ''

    units.select { |k, _| UNITS.keys.include?(k) }.each do |k, v|
      next if v != true

      secs = k == :year ? (options[:days_in_year] * UNITS[:day]).to_i : UNITS[k]
      value = seconds >= secs ? seconds / secs : 0
      if value > 0
        values << { name: k.to_s, value: value }
        seconds -= value * secs
      end
    end

    l = values.length
    values.each_with_index do |v, i|
      separator = if i == l - 1
                    ''
                  elsif i == l - 2 && options[:and_at_end] == true
                    " #{I18n.t('time_duration_humanizer.and')} "
                  else
                    ', '
                  end

      duration += v[:value].to_s
      duration += ' '
      duration += I18n.t("time_duration_humanizer.#{v[:name]}",
                         count: v[:value])
      duration += separator
    end

    duration
  end
end
