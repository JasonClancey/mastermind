module Display

    def display_comparison_results(correct, difference_in_codes)
        puts <<~HEREDOC
          There are #{correct} digits in the correct place.
          There are #{4 - difference_in_codes - correct} digits that are in the code, but in the wrong place.\n
        HEREDOC
    end

    def display_choose_player_type
        puts <<~HEREDOC
        Would you like to be the code breaker or code maker?
        Enter 1 to be the code breaker.
        Enter 2 to be the code maker.
      HEREDOC
    end

    def display_invalid_player_selection
        puts "Invalid selection. Please retry.\n"
    end

    def display_request_player_input(title)
        puts <<~HEREDOC
        Please enter a four digit code.
        This must be composed of integers between 1 and 6:
      HEREDOC
    end

    def display_code_is_valid
        puts 'Code accepted.'
    end

    def display_code_is_invalid
        puts "Invalid code. Please retry \n"
    end

end