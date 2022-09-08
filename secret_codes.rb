class SecretCode
    require_relative 'display'
    attr_reader :code_valid, :player_code, :computer_code
    include Display

    def initialize
        @player_code = ''
        @computer_code = ''
    end

    def player_code
        display_request_player_input
        @player_code = gets.chomp
    end

    def computer_code # random for now
        @computer_code = Array.new(4) { rand(1..6) }
    end

    def valid_code?
        @player_code = @player_code.split(//).map { |digit| digit.to_i }
        if @player_code.length == 4 && @player_code.all? { |digit| digit.instance_of?(Integer) && digit.between?(1,6) }
            display_code_is_valid
        else 
            display_code_is_invalid
            self.player_code
        end
    end
end
