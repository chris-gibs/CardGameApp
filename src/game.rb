# Require
require 'tty-prompt'

# Variables
players_in_game = []
dealers_hand = []
# Game methods
def number_of_players
    puts "Please enter number of players: "
    number = gets.chomp.to_i
    while number.between?(1, 4)
        
    end
end
def build_deck
    #include shuffle
    deck = BlackjackCards::Deck.new()
    p deck
end
def deal_card

end
def display_game
    Player.player_game_details
    puts "#{}"
end
def hit
    puts "Hit coming soon!"
end
def stand
    puts "Stand coming soon!"
end
def display_rules
    puts "Rules coming soon!"
end


