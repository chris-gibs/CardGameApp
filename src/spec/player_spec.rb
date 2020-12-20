require 'player.rb'
require 'index.rb'

# Player tests
Rspec.describe Player do
    it 'creates a new player' do
        player = Player.new
        expect(player).to be_kind_of(Player)
    end
end