class Faint
  attr_accessor :effect_round_left, :is_on

  def initialize args = {}
    args.each do |key, value|
      self.instance_variable_set("@#{key}", value) unless value.nil?
    end
    @is_on = true
  end

  def calculate player, &block
    @effect_round_left -= 1
    if effect_round_left <= 0
      @is_on = false
    end
    "#{player.name}晕倒了，无法攻击, 眩晕还剩：#{ @effect_round_left }轮"
  end
end

class Poison
  attr_accessor :effect_harm , :is_on

  def initialize args = {}
    args.each do |key, value|
      self.instance_variable_set("@#{key}", value) unless value.nil?
    end
    @is_on = true
    @effect_harm = 2
  end

  def calculate player, &block
    player.be_harmed @effect_harm
    result = "#{player.name}受到#{@effect_harm}点毒性伤害, #{player.name}剩余生命：#{player.hp}\n"
    result << block.call
  end
end

class NoEffect

  def is_on
    true
  end

  def calculate player, &block
    block.call
  end

end