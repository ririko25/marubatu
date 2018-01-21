# Copyright (c) 2018 ririko
#
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

require "test_helper"
require './lib/marubatu'
class StatusTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Marubatu::VERSION
  end
end
