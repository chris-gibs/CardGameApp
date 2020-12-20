# leaderboard.rb includes leaderboard function methods

# Leaderboard Methods
def generate_leaderboard(name)
    rank = 1
    working_message(@generating_leaderboard)
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
        success_message(@leaderboard_ready)
        working_message(@printing)
        system 'clear'
        puts $pastel.blue.on_black(leaderboard.render(:unicode))
    end
end