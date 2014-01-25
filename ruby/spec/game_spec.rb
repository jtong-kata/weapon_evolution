require 'spec_helper'
require 'weapon_evolution'


describe "Game" do
  let(:zhangsan) { flexmock(:on, Person) }

  let(:lisi) { flexmock(:on, Person) }

  let(:game) { Game.new }

  it "should beat each other until dead" do
    zhangsan.should_receive(:hp).twice.and_return(10, 0)
    zhangsan.should_receive(:attack).once.and_return("anything")

    lisi.should_receive(:hp).once.and_return(12)
    lisi.should_receive(:attack).twice.and_return("anything")

    game.fight_between lisi, zhangsan
  end

  it "should print attack returned string" do
    result = "张三被打败了"
    zhangsan.should_receive(:attack).and_return(result)
    lisi.should_receive(:hp).and_return(0)

    out = capture_stdout do
      game.fight_between zhangsan, lisi
    end

    expect(result+"\n").to eq out.string
  end

end