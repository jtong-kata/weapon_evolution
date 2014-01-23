require 'weapon_evolution/player'

describe "Player" do
  let(:zhangsan) { Player.new name: "张三", hp: 10, attack_point: 8 }

  let(:lisi) { Player.new name: "李四", hp: 20, attack_point: 9 }

  it "has health point, attack point, name " do
    expect(zhangsan.name).to eq "张三"
  end

  it "should beat each other until dead" do
    lisi.beat(zhangsan).should eq "张三被打败了"
  end
end