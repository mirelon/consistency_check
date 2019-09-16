require 'test_helper'

class ConsistencyCheckTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::ConsistencyCheck::VERSION
  end
end
