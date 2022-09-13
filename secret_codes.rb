class SecretCode
    require_relative 'display'
    attr_reader :secret_code
    include Display

    def initialize
        @secret_code = nil
    end

    def choose_player_code
        display_request_player_input
        @secret_code = gets.chomp
        valid_code?
    end

    def choose_computer_code
        #random for now
        @secret_code = Array.new(4) { rand(1..6) }
    end

    def valid_code?
        @secret_code = @secret_code.split(//).map { |digit| digit.to_i }
        if @secret_code.length == 4 && @secret_code.all? { |digit| digit.instance_of?(Integer) && digit.between?(1,6) }
            display_code_is_valid
        else 
            display_code_is_invalid
            self.choose_player_code
        end
    end
end
