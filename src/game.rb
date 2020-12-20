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
    # Create new deck array of card values and shuffle
    deck = Array.new(4) {10}
    deck += [*(1..9), 11]
    deck.shuffle!
end
def draw_card(hand)
    p deck
    hand << deck.delete_at[0]
    p hand
    p deck
end
def hand_value_check(hand_value)
    case
    when hand_value > 21
        puts "Greater than!"
    when hand_value == 21
        puts "Blackjack!"
    when hand_value < 21
        puts "Less than!"
    end
def display_game
    
end