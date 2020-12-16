# T1A3 Terminal App
# Texas Holdem Card Game
# By Christopher Gibson
# require_relative("./")

# Requires
require "tty-prompt"
require_relative 'game'

$prompt = TTY::Prompt.new
class MainMenu
    def self.display_help
        puts "Help coming soon!"
    end
    def self.main_menu_selection
        return $prompt.select("Please choose from the following options: ",
        ["Player Options", "New Game", "Leaderboard", "Help", "Exit"])
    end
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
            display_help
        end
    end
end
