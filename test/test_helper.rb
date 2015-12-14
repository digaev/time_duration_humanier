require 'i18n'
require 'minitest/autorun'
require 'time_duration_humanizer'

module TimeDurationHumanizer
  class Test < Minitest::Test
    def setup
      I18n.available_locales = [:en]
      I18n.locale = :en
      I18n.load_path = [[locales_dir + '/en.yml']]
    end

    protected

    def locales_dir
      File.dirname(__FILE__) + '/test_data/locales'
    end
  end
end

