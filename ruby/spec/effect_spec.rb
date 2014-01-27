require 'spec_helper'
require 'weapon_evolution'

describe "Effect" do
  let(:person) { Person.new name: "张三", hp: 20, attack_point: 8 }

  let(:solider) { Solider.new name: "李四", hp: 20, attack_point: 9,
                              defence_point: 2 }

  it "should stop attack when I am faint" do
    person.effect = Faint.new effect_round_left:2
    person.attack(solider).should eq "张三晕倒了，无法攻击, 眩晕还剩：1轮"
  end

  it "should each attack will reduce 1 effect round left and erase effect when effect round left is 0" do
    person.effect = Faint.new effect_round_left:1
    person.attack(solider).should eq "张三晕倒了，无法攻击, 眩晕还剩：0轮"
    person.attack(solider).should eq "普通人张三攻击了战士李四,李四受到了6点伤害,李四剩余生命：14"
  end

  it "should reduce health each round when I am poison" do
    person.effect = Poison.new
    person.attack(solider).should eq "张三受到2点毒性伤害, 张三剩余生命：18\n普通人张三攻击了战士李四,李四受到了6点伤害,李四剩余生命：14"
    person.attack(solider).should eq "张三受到2点毒性伤害, 张三剩余生命：16\n普通人张三攻击了战士李四,李四受到了6点伤害,李四剩余生命：8"
  end

  it "should reduce health each round when I am poison" do
    person.effect = Poison.new
    person.attack(solider).should eq "张三受到2点毒性伤害, 张三剩余生命：18\n普通人张三攻击了战士李四,李四受到了6点伤害,李四剩余生命：14"
    person.attack(solider).should eq "张三受到2点毒性伤害, 张三剩余生命：16\n普通人张三攻击了战士李四,李四受到了6点伤害,李四剩余生命：8"
  end
end