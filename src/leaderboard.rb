# leaderboard.rb includes leaderboard function methods

# Declarations

# Leaderboard Methods
def generate_leaderboard(name)
    rank = 1
    puts $pastel.yellow("Generating leaderboard...")
    sleep 1
    leaderboard = TTY::Table.new(header: ["Rank", "Name", "Games", "Wins", "Score"])
    break_away = get_player_data(name)
    # Prevents puts statements under .each iterator from executing if wrong name entered
    if break_away != true
        # Sort array by wins then score
        @players_from_file.sort_by! {|player| [player["score"], player["wins"]]}.reverse!
        # Put data (Name, Games, Wins, Score) into table
        @players_from_file.each do |index|
            leaderboard << [rank, index["name"], index["games"], index["wins"], index["score"]]
            rank += 1
        end
        puts $pastel.green("Leaderboard ready.")
        sleep 1
        puts "Printing..."
        sleep 1
        system 'clear'
        puts $pastel.blue.on_black(leaderboard.render(:unicode))
    end
end
def display_leaderboard
    generate_leaderboard(nil)
end
def search_leaderboard
    generate_leaderboard(get_name)
end