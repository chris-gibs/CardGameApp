# Require
require "tty-prompt"

require_relative 'deck'

# Game class

class Game
    def initialize
        @players_in_game = []
        @dealers_hand = []

    end
    def self.hit
        puts "Hit coming soon!"
    end
    def self.stand
        puts "Stand coming soon!"
    end
    def self.display_rules
        puts "Rules coming soon!"
    end
    # Game Menu
    def self.game_menu_selection
        return $prompt.select("New Game has begun! Pick an option: ",
        ["Hit", "Stand", "Rules", "Back"])
    end
    def self.game_menu
        selection = ""
        while selection != "Back"
            selection = game_menu_selection
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
end

