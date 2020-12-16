# Require

# Player class


class Player(name, password)
    def initialize
        @name = name
        @password = password
        @games = 0
        @wins = 0
        @score = 1000
        @hand = []
        @hand_value = 0
        @has_bet = false
        @lost = false
        @blackjack = false
    end
    def win
        puts "Winner winner, chicken dinner!"
        @games += 1
        @wins += 1
        @score = score_change
    end
    def lose
        puts "Better luck next time!"
        @games += 1
        @score = score_change
    end
    def bet
    
    end
    def load_from_file

    end
    def save_to_file

    end
end