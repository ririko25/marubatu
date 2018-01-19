# Copyright (c) 2018 ririko
#
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

require 'marubatu'
require 'thor'

module Marubatu
  # まるばつコマンド
  class CLI < Thor
    default_command :game

    desc 'game', 'start game'
    def game
      say(Marubatu::Board.new.to_s, :red)
    end
  end
end
