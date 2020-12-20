# T1A3 Terminal App
# Card Game
# By Christopher Gibson

# index.rb includes all menus, I/O, and error handling

# Requires
require 'tty-color'
require 'tty-font'
require 'tty-prompt'
require 'tty-table'
require 'pastel'
require 'yaml'
require 'io/console'
require_relative './game'
require_relative './player'
require_relative './leaderboard'

# Declarations
$pastel = Pastel.new
$font = TTY::Font.new(:starwars)
$prompt = TTY::Prompt.new(active_color: :blue)
system "clear"

# Menu Data
main_menu_name = "Main menu:"
main_menu_options = ["Player Options", "New Game", "Leaderboard", "Help", "Exit"]
@player_menu_name = "Player options:"
@player_menu_options = ["Create new player", "Edit player details", "Delete player", "Back"]
@new_game_menu_name = "Choose an option:"
@new_game_menu_options = ["Hit", "Stand", "Rules", "Back"]
@leaderboard_menu_name = "Leaderboard Options:"
@leaderboard_menu_options = ["Display Leaderboard", "Search Leaderboard", "Back"]
@edit_player_menu_name = "Edit Player Options"
@edit_player_menu_options = ["Name", "Password", "Back"]

# Success Messages
@correct_player_details = "Search successful!"
@change_complete = "Change complete."
@player_created = "Player created."
@correct_input = "Correct input found."
@leaderboard_ready = "Leaderboard ready."
# Working Messages
@change_applying = "Applying change..."
@creating_player = "Creating player..."
@player_searching = "Searching..."
@generating_leaderboard = "Generating leaderboard..."
@printing = "Printing..."
# Error Messages
@incorrect_player_details = "Player not found or details incorrect, please try again."
@incorrect_input = "That is incorrect!"

# Error Handling
def success_message(message)
    puts $pastel.green(message)
    sleep 1
end
def working_message(message)
    puts $pastel.yellow(message)
    sleep 1
end
def error_message(message)
    puts $pastel.red("Error: #{message}")
    sleep 1
end

# Greeting
def display_banner
    puts "#{$pastel.decorate($font.write("Black"), :black, :on_white, :bold)}\n#{$pastel.decorate($font.write("Jack"), :red, :on_white, :bold)}"
    sleep 1
end

# I/O Methods
def get_name
    puts "Please enter a name:"
    name = gets.chomp
end
def get_pass
    puts "Please enter a password:"
    password = STDIN.noecho(&:gets).chomp
end
def get_file(file_name)
    File.open("#{file_name}.txt").each {|line| puts line}
end
def get_player_data(name)
    @players_from_file = []
    players_file = File.read("./players_file.yml")
    # Gets all objects from yaml file and puts in array for iteration
    YAML::load_stream(players_file) do |object|
        @players_from_file << object
    end
    # Gets specific object if a name is given in method argument
    if name != nil
        object_index = @players_from_file.index {|player| player["name"] == name}
        if object_index != nil
            success_message(@correct_player_details)
            @players_from_file.reject!{|index| index != @players_from_file[object_index]}
        else
            error_message(@incorrect_player_details)
            # Returns to menu to try again
            break_away = true
        end
    end
end

# Menu Prompt Selection
def menu_selection(menu_name, menu_options)
    return $prompt.select(menu_name, menu_options)
end

# Menus
# Edit Player Menu
def edit_player_menu(player)
    selection = ""
    while selection != "Back"
        system "clear"
        selection = menu_selection(@edit_player_menu_name, @edit_player_menu_options)
        case selection
        when "Name"
            player["name"] = get_name
            return player
        when "Password"
            player["password"] = get_pass
            return player
        when "Back"
            return selection
        end
    end
end
# Leaderboard Menu
def leaderboard_menu
    system "clear"
    selection = ""
    while selection != "Back"
        selection = menu_selection(@leaderboard_menu_name, @leaderboard_menu_options)
        case selection
        when "Display Leaderboard"
            generate_leaderboard(nil)
        when "Search Leaderboard"
            generate_leaderboard(get_name)
        end
    end
end
# Game Menu
def game_menu(player)
    selection = ""
    while selection != "Back"
        system "clear"
        display_game(player)
        selection = menu_selection(@new_game_menu_name, @new_game_menu_options)
        case selection
        when "Hit"
            player["hand"] << draw_card
            puts "Youre before handvaluecheck"
            hand_value_check(player)
        when "Stand"
            hand_value_compare(player)
        when "Rules"
            get_file("rules")
            puts "Press any key to continue..."
            gets
            system "clear"
        end
    end
end
# Player Menu
def player_menu
    selection = ""
    while selection != "Back"
        system "clear"
        selection = menu_selection(@player_menu_name, @player_menu_options)
        case selection
        when "Create new player"
            create_player
        when "Edit player details"
            player_match("edit")
        when "Delete player"
            player_match("delete")
        end
    end
end
# Main Menu
selection = ""
while selection != "Exit"
    system "clear"
    display_banner
    selection = menu_selection(main_menu_name, main_menu_options)
    case selection
    when "Player Options"
        player_menu
    when "New Game"
        number_of_players("new game")
        game_loop
    when "Leaderboard"
        leaderboard_menu
    when "Help"
        get_file("help")
    end
end

# Goodbye Message
puts $pastel.decorate($font.write("Goodbye!"), :blue, :on_white, :bold)
sleep 1
system "clear"