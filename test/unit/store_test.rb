require 'minitest/autorun'
require_relative '../../lib/store'

class TestMeme < Minitest::Test
    def setup
        @meme = Meme.new
    end

    def test_that_kitty_can_eat
        assert_equal "OHAI!", @meme.i_can_has_cheezburger?
    end
end
