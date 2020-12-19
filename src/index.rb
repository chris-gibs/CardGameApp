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
@edit_player_menu_name = "Match found! what do you want to change?"
@edit_player_menu_options = ["Name", "Password", "Back"]

# Greeting
puts "Welcome to my Card Game App!"
sleep 1

# Input Methods
def get_name
    puts "Please enter a name:"
    name = gets.chomp
end
def get_pass
    puts "Please enter a password:"
    password = STDIN.noecho(&:gets).chomp
end
def get_player_data
    player = File.read("./players_file.yml")
    YAML::load_stream(player) do |object|
        @players_from_file << object
    end
end

# Output Methods
def store_player_data

end


def create_player
    # Create player object and store in players_file
    player_hash = {}
    player = Player.new(get_name, get_pass)
    player = player.instance_variables.each {|var| player_hash[var.to_s.delete("@")] = player.instance_variable_get(var) }
    File.open("./players_file.yml", "a+") {|file| file.write(player_hash.to_yaml)}
end


def player_match
    # Get player details and check against player_file data
    name = get_name
    pass = get_pass
    result = ""
    match = false
    puts "Searching..."
    sleep 1
    get_player_data
    p get_player_data
    p name
    p pass
    @players_from_file.each do |object|
        if name == object["name"] && pass == object["password"]
            result = "Match found"
            match = object
        elsif name == object["name"] && pass != object["password"]
            result = "Password incorrect"
        elsif name != object["name"]
            p name
            p object["name"]
            result = "Name not found"
        end
    end
    return result, match
end
def edit_player
    # Checks if player data matches data on file
    # then gives options on what data to change
    inputs = player_match
    result = inputs[0]
    match = inputs[1]
    p result
    p match
    case result
    when "Match found"
        puts "This works!"
        edit_player_menu(match)
    when "Password incorrect"

    when "Name not found"
        
    end
end
def delete_player
    get_player_data
end

def display_help
    puts "Help coming soon!"
end
def display_rules
    puts "rules coming soon!"
end

# Menu Prompt Selection
def menu_selection(menu_name, menu_options)
    return $prompt.select(menu_name, menu_options)
end

# Menu Loops
# Edit Player Menu
def edit_player_menu(match)
    selection = ""
    while selection != "Back"
        selection = menu_selection(@edit_player_menu_name, @edit_player_menu_options)
        system "clear"
        case selection
        when "Name"
            puts "Previous name is #{match["name"]}"
            gets_name
            puts "Name changed to #{match["name"]}"
        when "Password"
            gets_pass
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