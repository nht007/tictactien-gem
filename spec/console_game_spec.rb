require 'spec_helper'

describe "ConsoleGame" do
  it "starts a game loop" do    
    console = ConsoleGame.new()
    
    console.start
  end
end