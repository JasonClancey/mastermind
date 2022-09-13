require_relative 'secret_codes'
require_relative 'display'
require_relative 'game'
require_relative 'player'

def play_mastermind
    game = Game.new
    game.set_up_game
    game.breaker_take_turn
end

play_mastermind