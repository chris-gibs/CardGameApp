# T1A3 Terminal App
# Texas Holdem Card Game
# By Christopher Gibson
# require_relative("./")
# Main Menu
$prompt = TTY::Prompt.new

def main_menu_selection
    return $prompt.select("Please choose from the following options: ",
    ["Player Options", "New Game", "Leaderboard", "Help", "Exit"])
end

def game_menu_selection
    return $prompt.select("New Game has begun. Please choose from the following options: ",
    ["Bet Options", "Fold", "Rules", "Exit"])
end

selection = ""
while selection != "Exit"
    selection = main_menu_selection
    system "Clear"
    case selection
    when "Player Options"
        puts "Player Options coming soon!"
    when "New Game"
        puts "New Game coming soon!"
    when "Leaderboard"
        puts "Leaderboard coming soon!"
    when "Help"
        puts "Help coming soon!"
    end
    puts "Press any key to continue..."
    gets
    system "Clear"
end

selection = ""
while selection != "Exit"
    selection = main_menu_selection
    system "Clear"
    case selection
    when "Bet Options"
        puts "Bet Options coming soon!"
    when "Fold"
        puts "Fold coming soon!"
    when "Rules"
        puts "Rules coming soon!"
    end
    puts "Press any key to continue..."
    gets
    system "Clear"
end