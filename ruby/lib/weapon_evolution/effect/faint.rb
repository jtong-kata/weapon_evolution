class Faint
  attr_accessor :effect_round_left

  def initialize args = {}
    args.each do |key, value|
      self.instance_variable_set("@#{key}", value) unless value.nil?
    end
  end

  def calculate player, enemy, &block
    @effect_round_left -= 1
    if effect_round_left <= 0
      player.to_normal
    end
    "#{player.name}晕倒了，无法攻击, 眩晕还剩：#{ @effect_round_left }轮"
  end

  def trigger enemy,me
    "#{enemy.name}晕倒了"
  end
end
