require 'test_helper'

class TimeDurationHumanizerTest < TimeDurationHumanizer::Test
  def test_singular_time
    assert_equal '1 hour, 1 minute and 1 second', 3661.to_duration
  end

  def test_plural_time
    assert_equal '2 hours, 2 minutes and 2 seconds', 7322.to_duration
  end

  def test_singular_date
    assert_equal '1 year, 1 month and 1 day', 34236000.to_duration
  end

  def test_plural_date
    assert_equal '2 years, 2 months and 2 days', 68472000.to_duration
  end

  def test_weeks
    assert_equal '7 days', 604800.to_duration
    assert_equal '14 days', 1209600.to_duration

    assert_equal '1 week', 604800.to_duration(week: true)
    assert_equal '2 weeks', 1209600.to_duration(week: true)

    assert_equal '1 year, 1 month and 8 days', 34840800.to_duration
    assert_equal '1 year, 1 month, 1 week and 1 day', 34840800.to_duration(week: true)

    assert_equal '1 year, 1 month and 15 days', 35445600.to_duration
    assert_equal '1 year, 1 month, 2 weeks and 1 day', 35445600.to_duration(week: true)
  end

  def test_days_in_years
    assert_equal '1 year, 11 months, 24 days and 18 hours', 62208000.to_duration
    assert_equal '2 years', 62208000.to_duration(days_in_year: 360)
  end

  def test_and_at_end
    assert_equal '1 year, 11 months, 24 days, 18 hours', 62208000.to_duration(and_at_end: false)
  end
end
