class OnFire < Effect
  attr_accessor :effect_harm

  def initialize args = {}
    super args
    @effect_harm = 2
  end

  def calculate player, enemy, &block
    player.be_harmed @effect_harm
    result = "#{player.name}受到#{@effect_harm}点火焰伤害, #{player.name}剩余生命：#{player.hp}\n"
    result << block.call
  end

  def trigger enemy
    "#{enemy.name}着火了"
  end
end