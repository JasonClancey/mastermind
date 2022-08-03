class Game
    require_relative 'code_maker_and_breaker'

    def initialize
        @breaker = CodeMakerAndBreaker.new
        @maker = CodeMakerAndBreaker.new
    end

    def determine_breaker_maker
        puts <<~HEREDOC 
        Would you like to be the code breaker or code maker?
        Enter 1 to be the code breaker.
        Enter 2 to be the code maker."
        HEREDOC
        selection = gets.chomp.to_i
        case selection
        when 1
            @breaker.player = 'breaker'
        when 2
            @maker.player = 'maker'
        else 
            puts "Invalid selection. Please retry.\n"
            determine_breaker_maker
        end
    end


end