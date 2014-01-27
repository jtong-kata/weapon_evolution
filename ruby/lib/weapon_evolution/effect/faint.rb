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
