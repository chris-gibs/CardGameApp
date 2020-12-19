# T1A3 Terminal App
# Card Game
# By Christopher Gibson

# index.rb includes all menus, I/O, and error handling

# Requires
require 'tty-prompt'
require 'yaml'
require 'io/console'
require_relative './game'
require_relative './player'
require_relative './leaderboard'

# Declarations
$prompt = TTY::Prompt.new
system "clear"
@players_from_file = []

# Menu Data
main_menu_name = "Main menu:"
main_menu_options = ["Player Options", "New Game", "Leaderboard", "Help", "Exit"]
@player_menu_name = "Player options:"
@player_menu_options = ["Create new player", "Edit player details", "Delete player", "Back"]
@new_game_menu = "Choose an option:"
@new_game_options = ["Hit", "Stand", "Rules", "Back"]
@leaderboard_menu_name = "Leaderboard Options:"
@leaderboard_menu_options = ["Display Leaderboard", "Search Leaderboard", "Back"]
@edit_player_menu_name = "Edit Player Options"
@edit_player_menu_options = ["Name", "Password", "Back"]

# Greeting
puts "Welcome to my Card Game App!"
sleep 1

# Display Methods
def display_help
    puts "Help coming soon!"
end
def display_rules
    puts "Rules coming soon!"
end

# Menu Prompt Selection
def menu_selection(menu_name, menu_options)
    return $prompt.select(menu_name, menu_options)
end

# Menu Loops
# Edit Player Menu
def edit_player_menu(player)
    selection = ""
    while selection != "Back"
        selection = menu_selection(@edit_player_menu_name, @edit_player_menu_options)
        system "clear"
        case selection
        when "Name"
            player["name"] = get_name
            return player
        when "Password"
            player["password"] = get_pass
            return player
        end
    end
end
# Leaderboard Menu
def leaderboard_menu
    selection = ""
    while selection != "Back"
        selection = menu_selection(@leaderboard_menu_name, @leaderboard_menu_options)
        system "clear"
        case selection
        when "Display Leaderboard"
            puts "Display coming soon!"
            # create a file read method that is called for methods that
            # need it, slot the objects into an array then iterate over
            # the array
        when "Search Leaderboard"
            puts "Edit coming soon!"
        end
    end
end
# Game Menu
def game_menu
    selection = ""
    while selection != "Back"
        display_game
        selection = menu_selection(@game_menu_name, @game_menu_options)
        system "clear"
        case selection
        when "Hit"
            hit
        when "Stand"
            stand
        when "Rules"
            display_rules
        end
    end
end
# Player Menu
def player_menu
    selection = ""
    while selection != "Back"
        selection = menu_selection(@player_menu_name, @player_menu_options)
        system "clear"
        case selection
        when "Create new player"
            create_player
        when "Edit player details"
            edit_player
        when "Delete player"
            delete_player
        end
    end
end
# Main Menu
selection = ""
while selection != "Exit"
    selection = menu_selection(main_menu_name, main_menu_options)
    system "clear"
    case selection
    when "Player Options"
        player_menu
    when "New Game"
        number_of_players
        build_deck
        game_menu
    when "Leaderboard"
        leaderboard_menu
    when "Help"
        display_help
    end
end
puts "Goodbye!"
sleep 1
system "clear"