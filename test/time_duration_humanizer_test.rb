require 'test_helper'

class TimeDurationHumanizerTest < TimeDurationHumanizer::Test
  def test_singular_time
    assert_equal '1 hour, 1 minute and 1 second', TimeDurationHumanizer.humanize(3661)
    assert_equal '1 hour, 1 minute, 1 second', TimeDurationHumanizer.humanize(3661, { and_at_end: false })
  end

  def test_plural_time
    assert_equal '2 hours, 2 minutes and 2 seconds', TimeDurationHumanizer.humanize(7322)
    assert_equal '2 hours, 2 minutes, 2 seconds', TimeDurationHumanizer.humanize(7322, { and_at_end: false })
  end

  def test_singular_date
    assert_equal '1 year, 1 month and 1 day', TimeDurationHumanizer.humanize(34236000)
    assert_equal '1 year, 1 month, 1 day', TimeDurationHumanizer.humanize(34236000, { and_at_end: false })
  end

  def test_plural_date
    assert_equal '2 years, 2 months and 2 days', TimeDurationHumanizer.humanize(68472000)
    assert_equal '2 years, 2 months, 2 days', TimeDurationHumanizer.humanize(68472000, { and_at_end: false })
  end

  def test_weeks
    assert_equal '7 days', TimeDurationHumanizer.humanize(604800)
    assert_equal '14 days', TimeDurationHumanizer.humanize(1209600)

    assert_equal '1 week', TimeDurationHumanizer.humanize(604800, {}, { week: true })
    assert_equal '2 weeks', TimeDurationHumanizer.humanize(1209600, {}, { week: true })

    assert_equal '1 year, 1 month and 8 days', TimeDurationHumanizer.humanize(34840800)
    assert_equal '1 year, 1 month, 1 week and 1 day', TimeDurationHumanizer.humanize(34840800, {}, { week: true })

    assert_equal '1 year, 1 month and 15 days', TimeDurationHumanizer.humanize(35445600)
    assert_equal '1 year, 1 month, 2 weeks and 1 day', TimeDurationHumanizer.humanize(35445600, {}, { week: true })
  end

  def test_days_in_years
    assert_equal '1 year, 11 months, 24 days and 18 hours', TimeDurationHumanizer.humanize(62208000)
    assert_equal '2 years', TimeDurationHumanizer.humanize(62208000, { days_in_year: 360 })
  end
end
