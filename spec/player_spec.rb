require '../lib/player'

describe "Player" do
  it "has a player token" do
    player = Player.new('x')
    player.token.should_not be_nil
  end
end