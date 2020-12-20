require 'spec_helper.rb'

require_relative '../player.rb'
require_relative '../index.rb'
require_relative '../game.rb'

# Player tests
RSpec.describe Player do
    it 'should be initialized correctly' do
        player = Player.new("Player", "Password")
        expect(player).to be_instance_of Player
    end
    it 'should have a name and password' do
        player = Player.new("Player", "Password")
        expect(player["name"]).to eq("Player")
        expect(player["password"]).to eq("Password")
    end
end