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
    # Create deck array of card objects that include a name based on rank/suite
    # and a value relative to blackjack values

    deck = []
    p deck
    deck.shuffle
end
def deal_card(hand)
    hand << deck.delete_at[0]
end
def display_game
    
end
def hit
    puts "Hit coming soon!"
end
def stand
    puts "Stand coming soon!"
end