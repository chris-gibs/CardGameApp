# player.rb includes Player class and player option functions

# Player class
class Player
    attr_accessor :hand, :hand_value
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
        @aces_count = 0
        @lost = false
        @blackjack = false
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
    working_message(@player_searching)
    get_player_data(nil)
    # Find out where in our players from file array the player object is located
    index = @players_from_file.index {|player| player["name"] == name && player["password"] == pass}
    if index != nil
        success_message(@correct_player_details)
        # At this point we have the right player object index
        case option
        when "edit"
            selection = edit_player_menu(@players_from_file[index])
            if selection != "Back"
                change_player_data
            end
        when "delete"
            @players_from_file.delete_at(index)
            change_player_data
        when "new game"
            return index
        end
    else
        error_message(@incorrect_player_details)
    end
end
def change_player_data
    working_message(@change_applying)
    # Clears file
    File.open('./players_file.yml', 'w') {|file| file.truncate(0)}
    # Data from altered array is put into file
    @players_from_file.each do |index|
        File.open("./players_file.yml", "a+") do |file|
        file.write(index.to_yaml)
        end
    end
    success_message(@change_complete)
end
def create_player
    # Create player object and store in players_file
    player_hash = {}
    player = Player.new(get_name, get_pass)
    working_message(@creating_player)
    # Converts class properties into a hash with key-value pairs to store in yaml file
    player.instance_variables.each {|var| player_hash[var.to_s.delete("@")] = player.instance_variable_get(var) }
    File.open("./players_file.yml", "a+") {|file| file.write(player_hash.to_yaml)}
    success_message(@player_created)
    system 'clear'
end