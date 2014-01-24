require 'spec_helper'
require 'weapon_evolution'


describe "Game" do
  let(:zhangsan) { flexmock(:on, Player) }

  let(:lisi) { flexmock(:on, Player) }

  let(:game) {Game.new}

  it "should beat each other until dead" do
    zhangsan.should_receive(:hp).twice.and_return(10,0)
    lisi.should_receive(:hp).once.and_return(12)
    game.fight_between lisi, zhangsan

  end

end