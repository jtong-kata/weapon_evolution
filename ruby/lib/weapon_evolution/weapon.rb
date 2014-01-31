class Weapon
  attr_accessor :name, :attack_point, :effect

  def initialize args = {}
    args.each do |key, value|
      self.instance_variable_set("@#{key}", value) unless value.nil?
    end
    @effect = NoEffect.new
  end

  def trigger enemy, me
    @effect.trigger enemy, me
  end
end