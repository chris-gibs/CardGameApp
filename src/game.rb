# game.rb includes game function methods

# Variables
@players_in_game = []
dealers_hand = []
# Game methods
def number_of_players(option)
    # Loops until we get the number we're looking for
    continue = false
    while continue == false
        puts "Please enter number of players (Between 1 and 4): "
        number_of_players = gets.chomp.to_i
        if number_of_players.between?(1, 4)
            success_message(@correct_input)
            # Loops for each player confirming their details and
            #adding their object to the players in game array
            number = 0
            until number == number_of_players
                number = player_match(option)
            end
            continue = true
        else
            error_message(@incorrect_input)
        end
    end
    current_player = @players_in_game[0]
    p @players_in_game
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
end
def display_game
    
end