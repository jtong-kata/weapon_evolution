require 'spec_helper'
require 'weapon_evolution'

describe "Player" do
  let(:zhangsan) { Player.new name: "张三", hp: 10, attack_point: 8 }

  let(:lisi) { Player.new name: "李四", hp: 20, attack_point: 9 }

  it "has health point, attack point, name " do
    expect(zhangsan.name).to eq "张三"
  end

  it "should return formated result when attack " do
    lisi.attack(zhangsan) .should eq "李四攻击了张三,张三受到了9点伤害,张三剩余生命：1"
  end

  it "should return final result when someone has been dead" do
    lisi.attack(zhangsan)
    final_result = lisi.attack(zhangsan)
    final_result.should eq "张三被打败了"
  end

end