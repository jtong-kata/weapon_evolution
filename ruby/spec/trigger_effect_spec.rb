require 'spec_helper'
require 'weapon_evolution'

describe "Effect Trigger" do
  let(:person) { Person.new name: "张三", hp: 20, attack_point: 2 }

  let(:effect_weapon) {Weapon.new name:"带效果的兵器", attack_point: 5 }
  let(:solider) { Solider.new name: "李四", hp: 20, attack_point: 3,
                              defence_point: 2, weapon: effect_weapon }


  it "should print format string on trigger faint effect" do
    args = {effect_round_left:2, probability:1}
    effect_weapon.effect = Faint.new args
    solider.attack(person).should eq "战士李四用带效果的兵器攻击了普通人张三,张三受到了8点伤害,张三晕倒了,张三剩余生命：12"
  end

  it "should print format string on trigger frozen effect" do
    effect_weapon.effect = Frozen.new effect_round_left: 2, probability:1
    solider.attack(person).should eq "战士李四用带效果的兵器攻击了普通人张三,张三受到了8点伤害,张三冻僵了,张三剩余生命：12"
  end

  it "should print format string on trigger poison effect" do
    effect_weapon.effect = Poison.new probability:1
    solider.attack(person).should eq "战士李四用带效果的兵器攻击了普通人张三,张三受到了8点伤害,张三中毒了,张三剩余生命：12"
  end

  it "should print format string on trigger fire effect" do
    effect_weapon.effect = OnFire.new probability:1
    solider.attack(person).should eq "战士李四用带效果的兵器攻击了普通人张三,张三受到了8点伤害,张三着火了,张三剩余生命：12"
  end

  it "should print format string on trigger great harm effect" do
    effect_weapon.effect = GreatHarm.new probability:1
    solider.attack(person).should eq "战士李四用带效果的兵器攻击了普通人张三,李四发动了致命一击,张三受到了24点伤害,张三剩余生命：-4"
  end

  describe "Effect trigger probability" do
    it "should trigger effect with probability" do
      Random.srand 1234 # it means first Random.random returns 0.1915194503788923
      effect_weapon.effect = OnFire.new probability:0.2
      solider.attack(person).should eq "战士李四用带效果的兵器攻击了普通人张三,张三受到了8点伤害,张三着火了,张三剩余生命：12"
    end

    it "should not trigger effect when rand bigger than probability" do
      Random.srand 1234 # it means first Random.random returns 0.1915194503788923
      effect_weapon.effect = GreatHarm.new probability:0.1
      solider.attack(person).should eq "战士李四用带效果的兵器攻击了普通人张三,张三受到了8点伤害,张三剩余生命：12"
    end

    # should add all effect unit test
  end
end