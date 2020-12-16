# T1A3 Terminal App
# Texas Holdem Card Game
# By Christopher Gibson
# require_relative("./")

# Requires
require "tty-prompt"
require_relative 'game'
# Menus

$prompt = TTY::Prompt.new

def main_menu_selection
    return $prompt.select("Please choose from the following options: ",
    ["Player Options", "New Game", "Leaderboard", "Help", "Exit"])
end

class MainMenu
    selection = ""
    while selection != "Exit"
        selection = main_menu_selection
        system "clear"
        case selection
        when "Player Options"
            puts "Player Options coming soon!"
        when "New Game"
            Game.game_menu
        when "Leaderboard"
            puts "Leaderboard coming soon!"
        when "Help"
            puts "Help coming soon!"
        end
        system "clear"
    end
end
