# Copyright (c) 2018 ririko
#
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

# まるばつゲームのマスの状態
module Status
  MARU = 'o'.freeze
  BATU = 'x'.freeze
  KARA = '-'.freeze

  STATUS_NAME = {
    Status::MARU => '●',
    Status::BATU => '×',
    Status::KARA => '□'
  }.freeze

  def self.valid?(char)
    char == MARU || char == BATU || char == KARA
  end
end
