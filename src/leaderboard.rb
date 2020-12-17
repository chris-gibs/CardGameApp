# Leaderboard

class Leaderboard
    def initialize(players)
        @players = players
    end
    def self.display_leaderboard
        puts "Create coming soon!"
    end
    def search_leaderboard
    
    end
    def self.leaderboard_menu_selection
        return $prompt.select("Leaderboard Options: ",
        ["Display Leaderboard", "Search Leaderboard", "Back"])
    end
    def self.leaderboard_menu
        selection = ""
        while selection != "Back"
            selection = player_menu_selection
            system "clear"
            case selection
            when "Display Leaderboard"
                
            when "Search Leaderboard"
                puts "Edit coming soon!"
            end
        end
    end
end