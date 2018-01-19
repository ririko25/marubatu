require 'minitest/autorun'
require 'marubatu'
class MarubatuTest < Minitest::Test
  # テストの書き方のテンプレ
  # def test_hello
  #   assert_equal 'hello! ririko.', hello('ririko')
  #   assert_equal 'hello! naoya.', hello('naoya')
  #   assert_equal 'hello! matz.', hello('matz')
  # end

  def test_new
    a = Marubatu::Board.new
    assert_instance_of Marubatu::Board, a
    assert_equal 9, a.data.size
    # p a.data.join
    assert_equal '---------', a.data.join
  end

  def test_p_to_i
    # pos(y,x)をindexに変換する。
    # 3x3のマスと9要素の一次元配列。（x）
    # 二次元配列（y,x）
    assert_equal 1, Marubatu::Board.p_to_i(0, 1)
    assert_equal 2, Marubatu::Board.p_to_i(0, 2)
    assert_equal 3, Marubatu::Board.p_to_i(1, 0)
    assert_equal 4, Marubatu::Board.p_to_i(1, 1)
    assert_equal 5, Marubatu::Board.p_to_i(1, 2)
    assert_equal 6, Marubatu::Board.p_to_i(2, 0)
    assert_equal 7, Marubatu::Board.p_to_i(2, 1)
    assert_equal 8, Marubatu::Board.p_to_i(2, 2)
  end

  def test_i_to_p
    assert_equal [0, 0], Marubatu::Board.i_to_p(0)
    assert_equal [0, 1], Marubatu::Board.i_to_p(1)
    assert_equal [0, 2], Marubatu::Board.i_to_p(2)
    assert_equal [1, 0], Marubatu::Board.i_to_p(3)
    assert_equal [1, 1], Marubatu::Board.i_to_p(4)
    assert_equal [1, 2], Marubatu::Board.i_to_p(5)
    assert_equal [2, 0], Marubatu::Board.i_to_p(6)
    assert_equal [2, 1], Marubatu::Board.i_to_p(7)
    assert_equal [2, 2], Marubatu::Board.i_to_p(8)
  end

  def test_to_s
    r = Marubatu::Board.new
    assert_equal '---------', r.to_s
    assert_equal 'ox-------', Marubatu::Board.parse('ox-------').to_s
  end

  def test_parse
    assert_equal '---------', Marubatu::Board.parse('---------').data.join
    assert_equal 'ox-------', Marubatu::Board.parse('ox-------').data.join
  end

  def test_parse_length_error
    e = assert_raises RuntimeError do
      Marubatu::Board.parse('')
    end

    # エラーメッセージを検証
    assert_equal Marubatu::Board::ERROR_PARSE, e.message
  end

  def test_parse_char_error
    e = assert_raises RuntimeError do
      Marubatu::Board.parse('--------a')
    end

    # エラーメッセージを検証
    assert_equal Marubatu::Board::ERROR_PARSE, e.message
  end

  def test_win?
    assert_equal false, Marubatu::Board.new.win?(Status::MARU)
    assert_equal true, Marubatu::Board.parse('ooo----xx').win?(Status::MARU)
  end

  def test_end?
    assert_equal false, Marubatu::Board.new.end?
    assert_equal true, Marubatu::Board.parse('ooo----xx').end?
    assert_equal true, Marubatu::Board.parse('oxoxoooxx').end?
    assert_equal true, Marubatu::Board.parse('oo-o--xxx').end?
    # assert_equal false,Marubatu::Board.parse("xo-oox--x").end?
  end

  def test_draw?
    assert_equal false, Marubatu::Board.new.draw?
    assert_equal true, Marubatu::Board.parse('xoxoxooxo').draw?
  end

  def test_play
    assert_equal '----o----', Marubatu::Board.new.play(1, 1).to_s
    assert_equal '----o---x', Marubatu::Board.new.play(1, 1).play(2, 2).to_s

    # TODO: エラーの場合のテストも後で追加してね。
    # assert_raises RuntimeError do
    #   Marubatu::Board.new.play(1, 1).play(1, 1)
    # end
  end
end
