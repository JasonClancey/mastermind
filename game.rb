class Game
    require_relative 'secret_codes'
    require_relative 'player'
    require_relative 'display'
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

    def breaker_wins?
        if @breaker.secret_code.eql?(@maker.secret_code) && @turn <= 11
            display_breaker_wins
            @game_over = true
        end
    end

    def maker_wins?
        if @breaker.secret_code.eql?(@maker.secret_code) == false && @turn > 11
        display_maker_wins
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

    def set_up_game
        display_intro
        breaker_or_maker?
        case @player.title
        when 'breaker'
            @maker.choose_computer_code
        when 'maker'
            @maker.choose_player_code
        end
    end

    def breaker_take_turn
        while @turn <= 11 && @game_over == false
            case @player.title
            when 'breaker'
                @breaker.choose_player_code
            when 'maker'
                @breaker.choose_computer_code
                display_computer_code
                sleep 2
            end
        compare_secret_codes
        reset_comparison_values
        breaker_wins?
        @turn += 1
        puts "The current turn is #{@turn}."
        end
        maker_wins?
    end

end
