require 'spec_helper'
require 'weapon_evolution'

describe "Solider" do
  let(:zhangsan) { Person.new name: "张三", hp: 20, attack_point: 8 }

  let(:good_stick) { Weapon.new name: "优质木棍", attack_point: 3 }

  let(:good_leather_armour) { Armor.new name: "优质皮具", defence_point: 2 }

  let(:lisi) { Solider.new name: "李四", hp: 20, attack_point: 9, defence_point: 2, weapon: good_stick, armor: good_leather_armour }

  it "should return formated result when attack " do
    lisi.attack(zhangsan).should eq "战士李四用优质木棍攻击了普通人张三,张三受到了12点伤害,张三剩余生命：8"
  end

  it "should armor reduce harm" do
    zhangsan.attack(lisi).should eq "普通人张三攻击了战士李四,李四受到了4点伤害,李四剩余生命：16"
  end

end