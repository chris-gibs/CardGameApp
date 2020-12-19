# player.rb includes Player class and player option functions

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
end

# Player Option Functions
def player_match(option)
    # Get player details and check against player_file data
    name = get_name
    pass = get_pass
    system 'clear'
    puts $pastel.yellow("Searching...")
    sleep 1
    get_player_data(nil)
    index = @players_from_file.index {|player| player["name"] == name && player["password"] == pass}
    if index != nil
        puts $pastel.green("Search successful!")
        sleep 1
        case option
        when "edit"
            selection = edit_player_menu(@players_from_file[index])
            if selection != "Back"
                change_player_data
            end
        when "delete"
            # delete player object from array at index
            @players_from_file.delete_at(index)
            change_player_data
        end
    else
        puts $pastel.red ("Player not found or details incorrect, please try again.")
    end
end
def change_player_data
    puts $pastel.yellow("Applying change...")
    sleep 1
    # Clears file
    File.open('./players_file.yml', 'w') {|file| file.truncate(0)}
    # Data from altered array is put into file
    @players_from_file.each do |index|
        File.open("./players_file.yml", "a+") do |file|
        file.write(index.to_yaml)
        end
    end
    puts $pastel.green("Change complete.")
    sleep 1
end
def create_player
    # Create player object and store in players_file
    player_hash = {}
    player = Player.new(get_name, get_pass)
    puts $pastel.yellow("Creating player...")
    sleep 1
    # Converts class properties into a hash with key-value pairs to store in yaml file
    player.instance_variables.each {|var| player_hash[var.to_s.delete("@")] = player.instance_variable_get(var) }
    File.open("./players_file.yml", "a+") {|file| file.write(player_hash.to_yaml)}
    puts $pastel.green("Player #{player_hash["name"]} created.")
    sleep 1
    system 'clear'
end
def edit_player
    player_match("edit")
end
def delete_player
    player_match("delete")
end