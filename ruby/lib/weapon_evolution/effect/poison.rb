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
