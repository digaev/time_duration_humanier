require "time_duration_humanizer/version"

module TimeDurationHumanizer
  @@known_units = [:years, :months, :weeks, :days, :hours, :minutes, :seconds]

  def self.humanize(seconds, options = {}, and_at_end = true)
    options = {
      years: true,
      months: true,
      weeks: false,
      days: true,
      hours: true,
      minutes: true,
      seconds: true
    }.merge(options.symbolize_keys)

    units = []
    duration = ''

    options.each do |k, v|
      if v == true && @@known_units.include?(k)
        u = 1.send(k).to_i
        value = seconds >= u ? seconds / u : 0
        if value > 0
          unit = { name: k.to_s, value: value }
          units << unit

          seconds -= value * u
        end
      end
    end

    l = units.length
    units.each_with_index do |unit, i|
      separator = i == l - 1 ? '' : (i == l - 2 && and_at_end == true ? " #{I18n.t('time_duration_humanizer.and')} " : ', ')
      duration += "#{unit[:value]} #{I18n.t("time_duration_humanizer.#{unit[:value] == 1 ? unit[:name].singularize : unit[:name]}")}#{separator}"
    end

    duration
  end
end
