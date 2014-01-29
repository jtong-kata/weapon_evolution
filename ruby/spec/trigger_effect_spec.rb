require 'spec_helper'
require 'weapon_evolution'

describe "Effect Trigger" do
  let(:person) { Person.new name: "张三", hp: 20, attack_point: 2 }

  let(:faint_stick) {Weapon.new name:"晕锤", attack_point: 5, effect:Faint.new(effect_round_left:2) }
  let(:solider) { Solider.new name: "李四", hp: 20, attack_point: 3,
                              defence_point: 2, weapon: faint_stick }


  it "should print format string on trigger" do
    solider.attack(person).should eq "战士李四用晕锤攻击了普通人张三,张三受到了8点伤害,张三晕倒了,张三剩余生命：12"
  end


end