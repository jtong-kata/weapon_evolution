require 'weapon_evolution/player'

describe "Player" do
  it "has health point, attack point, name " do
    player = Player.new
    player.name = "张三"
    player.hp = 10
    player.attack_point = 8
    expect(player.name).to eq "张三"
  end
end