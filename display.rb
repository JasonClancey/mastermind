module Display

    def display_intro
        puts <<~HEREDOC
        This is a single player game where you will play against a computer opponent. 
        You may choose to be either the code maker or code breaker.
        As the code breaker, the computer will generate a random 4 digit code and you must guess what it is.
        As the code maker, you will generate a 4 digit code and the computer will attempt to guess what it is.
        The code must be correctly guessed in 12 or less turns or the code maker wins.\n
        HEREDOC
    end

    def display_computer_code
        puts "The computer has guessed #{@breaker.secret_code.join}."
    end

    def display_choose_player_type
        puts <<~HEREDOC
        Would you like to be the code breaker or code maker?
        Enter 1 to be the code breaker.
        Enter 2 to be the code maker.
      HEREDOC
    end

    def display_comparison_results(correct, difference_in_codes)
        puts <<~HEREDOC
          There are #{correct} digits in the correct place.
          There are #{4 - difference_in_codes - correct} digits that are in the code, but in the wrong place.
        HEREDOC
    end

    def display_invalid_player_selection
        puts "Invalid selection. Please retry.\n"
    end

    def display_request_player_input
        puts <<~HEREDOC
        Player, please enter a four digit code.
        This must be composed of integers between 1 and 6:
      HEREDOC
    end

    def display_code_is_valid
        puts 'Code accepted.'
    end

    def display_code_is_invalid
        puts "Invalid code. Please retry."
    end

    def display_breaker_wins
        puts 'The code has been correctly guessed. The code breaker wins!'
    end

    def display_maker_wins
        puts 'The code was not guessed correctly in 12 turns. The code maker wins!'
    end

end