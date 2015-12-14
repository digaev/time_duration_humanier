require "time_duration_humanizer/version"

module TimeDurationHumanizer
  @@units = {
    years: 31557600,
    months: 2592000,
    weeks: 604800,
    days: 86400,
    hours: 3600,
    minutes: 60,
    seconds: 1
  }

  def self.humanize(seconds, options = {}, units = {})
    options = {
      and_at_end: true,
      days_in_year: 365.25
    }.merge!(options)

    units = {
      years: true,
      months: true,
      weeks: false,
      days: true,
      hours: true,
      minutes: true,
      seconds: true
    }.merge!(units)

    values = []
    duration = ''

    units.each do |k, v|
      if v == true && @@units.keys.include?(k)
        u = k == :years ? (options[:days_in_year] * @@units[:days]).to_i : @@units[k]
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
      duration += "#{v[:value]} #{I18n.t("time_duration_humanizer.#{v[:value] == 1 ? v[:name].chop : v[:name]}")}#{separator}"
    end

    duration
  end
end
