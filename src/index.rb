# T1A3 Terminal App
# Texas Holdem Card Game
# By Christopher Gibson
# require_relative("./")

# Requires
require "tty-prompt"

# Menus

$prompt = TTY::Prompt.new

def main_menu_selection
    return $prompt.select("Please choose from the following options: ",
    ["Player Options", "New Game", "Leaderboard", "Help", "Exit"])
end

def game_menu_selection
    return $prompt.select("New Game has begun! Pick an option: ",
    ["Bet Options", "Fold", "Rules", "Exit"])
end

def game_menu
    selection = ""
    while selection != "Exit"
        selection = game_menu_selection
        system "Clear"
        case selection
        when "Place Bet"
            puts "Bet Options coming soon!"
        when "Fold"
            puts "Fold coming soon!"
        when "Rules"
            puts "Rules coming soon!"
        end
        system "Clear"
    end
end

selection = ""
while selection != "Exit"
    selection = main_menu_selection
    system "Clear"
    case selection
    when "Player Options"
        puts "Player Options coming soon!"
    when "New Game"
        game_menu
    when "Leaderboard"
        puts "Leaderboard coming soon!"
    when "Help"
        puts "Help coming soon!"
    end
    system "Clear"
end

