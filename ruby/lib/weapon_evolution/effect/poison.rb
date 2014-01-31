class Poison
  attr_accessor :effect_harm
  include KeepingEffect

  def initialize args = {}
    args.each do |key, value|
      self.instance_variable_set("@#{key}", value) unless value.nil?
    end
    @effect_harm = 2
  end

  def calculate player, enemy, &block
    player.be_harmed @effect_harm
    result = "#{player.name}受到#{@effect_harm}点毒性伤害, #{player.name}剩余生命：#{player.hp}\n"
    result << block.call
  end

  def trigger enemy
    "#{enemy.name}中毒了"
  end

end
