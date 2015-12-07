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
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/digaev/time_duration_humanizer.

