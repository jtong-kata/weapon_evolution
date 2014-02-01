class Faint < Effect
  attr_accessor :effect_round_left

  def calculate player, enemy, &block
    @effect_round_left -= 1
    if effect_round_left <= 0
      player.to_normal
    end
    "#{player.name}晕倒了，无法攻击, 眩晕还剩：#{ @effect_round_left }轮"
  end

  def trigger enemy
    "#{enemy.name}晕倒了"
  end
end
