# Player class


class Player(name, password)
    def initialize
        @name = name
        @password = password
        @hand = []
        @games = 0
        @wins = 0
        @score = 1000
    end
    def win(pot)
        puts "Winner winner, chicken dinner!"
        @games += 1
        @wins += 1
        @score = score + pot
    end
    def lose
        puts "Better luck next time!"
        @games += 1
    end
end