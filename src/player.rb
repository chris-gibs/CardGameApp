# player.rb includes Player class and player option functions

# Require
require 'tty-prompt'

# Player class
class Player
    def initialize(name, password)
        @name = name
        @password = password
        @games = 0
        @wins = 0
        @score = 1000
        @hand = []
        @hand_value = 0
        @bet = 0
        @has_bet = false
        @lost = false
        @blackjack = false
        #@players_index = players.length - 1
    end
    def self.win
        puts "Winner winner, chicken dinner!"
        @games += 1
        @wins += 1
        @score = score_change
    end
    def self.lose
        puts "Better luck next time!"
        @games += 1
        @score = score_change
    end
    def self.player_game_details
        puts "#{@name}    #{@hand}    #{@bet}"
    end
end

# Player Option Functions
# Input/Output Methods
def get_name
    puts "Please enter a name:"
    name = gets.chomp
end
def get_pass
    puts "Please enter a password:"
    password = STDIN.noecho(&:gets).chomp
end
def get_player_data
    # Gets all objects from yaml file and puts in array for iteration
    players_file = File.read("./players_file.yml")
    YAML::load_stream(players_file) do |object|
        @players_from_file << object
    end
end
def player_match(option)
    # Get player details and check against player_file data
    name = get_name
    pass = get_pass
    system 'clear'
    puts "Searching..."
    sleep 1
    get_player_data
    index = @players_from_file.index {|player| player["name"] == name && player["password"] == pass}
    if index != nil
        puts "Search successful!"
        sleep 1
        case option
        when "edit"
            edit_player_menu(@players_from_file[index])
            change_player_data
        when "delete"
            # delete player object from array at index
            @players_from_file.delete_at(index)
            change_player_data
        end
    else
        puts "Player not found or details incorrect, please try again."
    end
end
def change_player_data
    puts "Applying change..."
    sleep 1
    # Clears file
    File.open('./players_file.yml', 'w') {|file| file.truncate(0)}
    # Data from altered array is put into file
    @players_from_file.each do |index|
        File.open("./players_file.yml", "a+") do |file|
        file.write(index.to_yaml)
        end
    end
    puts "Change complete."
end

# Main Functions
def create_player
    # Create player object and store in players_file
    player_hash = {}
    player = Player.new(get_name, get_pass)
    # Converts class properties into a hash with key-value pairs to store in yaml file
    player = player.instance_variables.each {|var| player_hash[var.to_s.delete("@")] = player.instance_variable_get(var) }
    File.open("./players_file.yml", "a+") {|file| file.write(player_hash.to_yaml)}
end
def edit_player
    player_match("edit")
end
def delete_player
    player_match("delete")
end