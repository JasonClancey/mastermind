class CodeMakerAndBreaker
    attr_reader :code_valid, :secret_code
    attr_accessor :player

    def initialize
        @code_valid = false
        @secret_code = ''
        @player = ''
    end

    def player_input
        puts <<~HEREDOC
        Code #{@player}, please enter a four digit code. 
        This must be composed of integers between 1 and 6:
        HEREDOC
        @secret_code = gets.chomp
    end

    def computer_input # random for now
        @secret_code = Array.new(4) {rand(1..6)}
    end

    def valid_code?
        @secret_code = @secret_code.split(//).map { |digit| digit.to_i }
        if @secret_code.length == 4 && @secret_code.all? { |digit| digit.instance_of?(Integer) && digit.between?(1,6) }
            @code_valid = true
            puts 'Code accepted.'
        else 
            puts 'Invalid code.'
        end
    end
end

run = CodeMakerAndBreaker.new
run.player_input
run.valid_code?
puts run.secret_code