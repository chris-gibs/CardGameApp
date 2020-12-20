# game.rb includes game function methods

# Variables
@players_in_game = []
@dealer_hand = []
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
end
def game_loop
    build_deck
    @dealer_hand << draw_card << draw_card
    game_over = false
    while game_over == false
        # Player loop
        @players_in_game.each do |player|
            player_bet(player)
            player["hand"] << draw_card << draw_card
            display_game
            game_menu(player)
            if player["lost"] == true
                Player.lose
            end
        end
    end
end
def build_deck
    # Create new deck array of card values and shuffle
    @deck = Array.new(4) {10}
    @deck += [*(1..9), 11]
    @deck.shuffle!
end
def draw_card
    # Removes card from deck and puts it into hand
    @deck.delete_at(0)
end
def player_bet(player)
    continue = false
    while continue == false
        puts "Your score: #{player["score"]}"
        puts "Enter an amount of your score you'd like to bet:"
        bet = gets.chomp.to_i
        if bet <= player["score"] && bet > 0
            success_message(@correct_input)
            player["bet"] = bet
            continue = true
        else
            error_message(@incorrect_input)
        end
    end
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
    system 'clear'
    puts "Your hand value: "
end