require 'weapon_evolution/player'

describe "Player" do
  it "has health point, attack point, name " do
    player = Player.new
    player.name = "张三"
    player.hp = 10
    player.attack_point = 8
    expect(player.name).to eq "张三"
  end

  it "should beat each other until dead" do
    zhangsan = Player.new
    zhangsan.name = "张三"
    zhangsan.hp = 10
    zhangsan.attack_point = 8

    lisi = Player.new
    lisi.name = "李四"
    lisi.hp = 20
    lisi.attack_point = 9

    lisi.beat(zhangsan).should eq "张三被打败了"

  end
end