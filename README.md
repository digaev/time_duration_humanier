# TimeDurationHumanizer

An extremely simple gem for converting seconds to human-readable format.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'time_duration_humanizer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install time_duration_humanizer

## Usage

```ruby
irb(main):001:0> TimeDurationHumanizer.humanize(12345)
=> "3 hours, 25 minutes and 45 seconds"

irb(main):002:0> TimeDurationHumanizer.humanize(12345, {}, end_at_end: false)
=> "3 hours, 25 minutes, 45 seconds"

irb(main):003:0> TimeDurationHumanizer.humanize(1234567890)
=> "39 years, 1 month, 14 days, 5 hours, 31 minutes and 30 seconds"

irb(main):004:0> TimeDurationHumanizer.humanize(1234567890, { weeks: true })
=> "39 years, 1 month, 2 weeks, 5 hours, 31 minutes and 30 seconds"
```

## Options (second parameter)

* years - default `true`
* months - default `true`
* weeks - default `false`
* days - default `true`
* hours - default `true`
* minutes - default `true`
* seconds - default `true`

## Localization

In your Rails application edit `config/locales/en.yml`:

```yml
en:
  time_duration_humanizer:
    and: and
    year: year
    years: years
    month: month
    months: months
    week: week
    weeks: weeks
    day: day
    days: days
    hour: hour
    hours: hours
    minute: minute
    minutes: minutes
    second: second
    seconds: seconds
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/digaev/time_duration_humanizer.
