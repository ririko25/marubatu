# Copyright (c) 2018 ririko
#
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

# def hello(name)
#   "hello! #{name}."
# end

require 'marubatu/status'
module Marubatu
  # まるばつ
  class Board
    ERROR_PARSE = '入力パラメーターが間違ってますよ！'.freeze

    def self.p_to_i(y, x)
      x + y * 3
    end

    def self.i_to_p(i)
      # [y,x]で返す。
      y = (i / 3).floor
      # x = i - y * 3
      x = i % 3
      [y, x]
    end

    def self.parse(str)
      raise ERROR_PARSE if str.length != 9

      m = Board.new
      str.split('').each.with_index do |c, i|
        raise ERROR_PARSE unless Status.valid?(c)
        m.data[i] = c
      end
      m
    end

    attr_reader :data

    def initialize
      @data = Array.new(9, Status::KARA)
    end

    def to_s
      @data.join
    end

    def win?(s)
      if @data.values_at(0, 1, 2).count(s) == 3
        true
      elsif @data.values_at(3, 4, 5).count(s) == 3
        true
      elsif @data.values_at(6, 7, 8).count(s) == 3
        true
      elsif @data.values_at(0, 3, 6).count(s) == 3
        true
      elsif @data.values_at(1, 4, 7).count(s) == 3
        true
      elsif @data.values_at(2, 5, 8).count(s) == 3
        true
      elsif @data.values_at(2, 4, 6).count(s) == 3
        true
      else
        @data.values_at(0, 4, 8).count(s) == 3
      end
    end

    def end?
      win?(Status::MARU) || win?(Status::BATU) || @data.count(Status::KARA).zero?
    end

    def draw?
      end? && !win?(Status::MARU) && !win?(Status::BATU)
    end

    def play(y, x)
      turn = @data.count(Status::KARA).odd? ? Status::MARU : Status::BATU
      i = Board.p_to_i(y, x)
      @data[i] = turn
      self
    end
  end
end
