# Copyright (c) 2018 ririko
#
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

require "test_helper"
require 'marubatu/status'
class StatusTest < Minitest::Test
  def setup
    @dummy_object = Object.new

    @dummy_object.extend(Status)
  end

  def test_valid?
    assert_equal true, Status.valid?('o')
    assert_equal true, Status.valid?('x')
    assert_equal true, Status.valid?('-')
    assert_equal false, Status.valid?(' ')
    assert_equal false, Status.valid?('あ')
  end
end
