class Game
    require_relative 'code_maker_and_breaker'
    attr_reader :maker, :breaker

    def initialize
        @breaker = CodeMakerAndBreaker.new
        @maker = CodeMakerAndBreaker.new
        @game_over = false
        @correct = 0
        @difference_in_codes = 0
    end

    def human_is_breaker
        @breaker.player = 'human'
        @breaker.title = 'breaker'
        @maker.player = 'computer'
    end

    def human_is_maker
        @maker.player = 'human'
        @maker.title = 'maker'
        @breaker.player = 'computer'
    end

    def breaker_or_maker?
        puts <<~HEREDOC
          Would you like to be the code breaker or code maker?
          Enter 1 to be the code breaker.
          Enter 2 to be the code maker.
        HEREDOC
        selection = gets.chomp.to_i
        case selection
        when 1
            self.human_is_breaker
        when 2
            self.human_is_maker
        else
            puts "Invalid selection. Please retry.\n"
            self.breaker_or_maker?
        end
    end

    def game_over?
        if @breaker.secret_code.eql?(@maker.secret_code)
            @game_over = true
        end
    end

    def compare_secret_codes
        i = 0
        while i < @breaker.secret_code.length
            if @breaker.secret_code[i] == @maker.secret_code[i]
                @correct += 1
            end
            i += 1
        end
        @difference_in_codes = @breaker.secret_code.difference(@maker.secret_code).length
    end

    def display_comparison_results
        puts <<~HEREDOC
          There are #{@correct} digits in the correct place.
          There are #{4 - @difference_in_codes - @correct} digits that are in the code, but in the wrong place.
        HEREDOC
    end

end

game = Game.new
game.breaker_or_maker?
game.breaker.player_input
game.breaker.valid_code?
game.maker.computer_input
game.compare_secret_codes
game.display_comparison_results