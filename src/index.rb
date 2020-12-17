# T1A3 Terminal App
# Card Game
# By Christopher Gibson

# Requires
require "tty-prompt"
require_relative './game'
require_relative './player'
require_relative './deck'
require_relative './leaderboard'

# Declarations
$prompt = TTY::Prompt.new

# I/O methods
def get_players_file
    file = gets.chomp
    players_file = IO.binread(file)
end
def display_help
    puts "Help coming soon!"
end
def display_rules
    puts "rules coming soon!"
end

# Leaderboard Menu
def leaderboard_menu_selection
    return $prompt.select("Leaderboard Options: ",
    ["Display Leaderboard", "Search Leaderboard", "Back"])
end
def leaderboard_menu
    selection = ""
    while selection != "Back"
        selection = player_menu_selection
        system "clear"
        case selection
        when "Display Leaderboard"
            
        when "Search Leaderboard"
            puts "Edit coming soon!"
        end
    end
end
# Game Menu
def game_menu_selection
    return $prompt.select("Pick an option: ",
    ["Hit", "Stand", "Rules", "Back"])
end
def game_menu
    selection = ""
    while selection != "Back"
        display_game
        selection = game_menu_selection
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
def player_menu_selection
    return $prompt.select("Player options: ",
    ["Create new player", "Edit player details", "Delete player", "Back"])
end
def player_menu
    selection = ""
    while selection != "Back"
        selection = player_menu_selection
        system "clear"
        case selection
        when "Create new player"
            puts "Create coming soon!"
        when "Edit player details"
            puts "Edit coming soon!"
        when "Delete player"
            puts "Delete coming soon!"
        end
    end
end
# Main Menu
def main_menu_selection
    return $prompt.select("Please choose from the following options: ",
    ["Player Options", "New Game", "Leaderboard", "Help", "Exit"])
end
selection = ""
while selection != "Exit"
    selection = main_menu_selection
    system "clear"
    case selection
    when "Player Options"
        player_menu
    when "New Game"
        game_menu
    when "Leaderboard"
        puts "Leaderboard coming soon!"
    when "Help"
        display_help
    end
end
