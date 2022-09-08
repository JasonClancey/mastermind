class Game
    require_relative 'code_maker_and_breaker', 'player', 'display'
    attr_reader :maker, :breaker, :correct, :difference_in_codes

    include Display

    def initialize
        @breaker = SecretCode.new
        @maker = SecretCode.new
        @game_over = false
        @turn = 0
        @correct = 0
        @difference_in_codes = 0
        @player = nil
    end

    def breaker_or_maker?
        display_choose_player_type
        selection = gets.chomp.to_i
        case selection
        when 1
            title = 'breaker'
            @player = Player.new(title)
        when 2
            title = 'maker'
            @player = Player.new(title)
        else
            display_invalid_player_selection
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
        display_comparison_results(@correct, @difference_in_codes)
    end

    def reset_comparison_values
        @correct = 0
        @difference_in_codes = 0
    end

    def take_turn

    end

end
