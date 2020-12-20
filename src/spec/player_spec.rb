require 'player.rb'
require 'index.rb'

# Player tests
Rspec.describe Player do
    it 'creates a new player' do
        player = Player.new
        expect(player).to be_kind_of(Player)
    end
end

# Game tests
Rspec.describe Game do
    it 'makes sure number entered is between 1 and 4' do
        number = gets.chomp.to_i
        expect(number).to eq(1..4)
    end
end