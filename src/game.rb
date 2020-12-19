# game.rb includes game function methods

# Variables
@players_in_game = []
dealers_hand = []
# Game methods
def number_of_players
    while false
        puts "Please enter number of players (Between 1 and 4): "
        number = gets.chomp.to_i
        if number.between?(1, 4)
            puts "That is correct!"
            true
        else
            puts "That is incorrect! Enter a number between 1 and 4:"
        end
    end
end
def build_deck
    #include shuffle
    deck = 
    p deck
    deck.shuffle
end
def deal_card

end
def display_game
    
end
def hit
    puts "Hit coming soon!"
end
def stand
    puts "Stand coming soon!"
end