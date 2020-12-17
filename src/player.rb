# Require
require "tty-prompt"
# Player class


class Player
    def initialize(name, password)
        @name = name
        @password = password
        @games = 0
        @wins = 0
        @score = 1000
        @hand = []
        @hand_value = 0
        @bet = 0
        @has_bet = false
        @lost = false
        @blackjack = false
    end
    def self.win
        puts "Winner winner, chicken dinner!"
        @games += 1
        @wins += 1
        @score = score_change
    end
    def self.lose
        puts "Better luck next time!"
        @games += 1
        @score = score_change
    end
    def self.bet
        
    end
    def self.load_from_file

    end
    def self.save_to_file

    end
    def player_game_details
        puts "#{@name}    #{@hand}    #{@bet}"
    end
end