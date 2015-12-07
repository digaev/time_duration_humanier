require "time_duration_humanizer/version"

module TimeDurationHumanizer
  @@known_units = [:years, :months, :weeks, :days, :hours, :minutes, :seconds]

  def self.humanize(seconds, options = {}, units = {})
    options = {
      and_at_end: true,
      days_in_year: 365.25
    }.merge!(options.symbolize_keys)

    units = {
      years: true,
      months: true,
      weeks: false,
      days: true,
      hours: true,
      minutes: true,
      seconds: true
    }.merge!(units.symbolize_keys)

    values = []
    duration = ''

    units.each do |k, v|
      if v == true && @@known_units.include?(k)
        u = (k == :years ? options[:days_in_year].days : 1.send(k)).to_i
        value = seconds >= u ? seconds / u : 0
        if value > 0
          values << { name: k.to_s, value: value }
          seconds -= value * u
        end
      end
    end

    l = values.length
    values.each_with_index do |v, i|
      separator = i == l - 1 ? '' : (i == l - 2 && options[:and_at_end] == true ? " #{I18n.t('time_duration_humanizer.and')} " : ', ')
      duration += "#{v[:value]} #{I18n.t("time_duration_humanizer.#{v[:value] == 1 ? v[:name].singularize : v[:name]}")}#{separator}"
    end

    duration
  end
end
