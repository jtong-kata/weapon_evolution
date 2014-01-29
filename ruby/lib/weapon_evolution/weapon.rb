class Weapon
  attr_accessor :name, :attack_point, :effect

  def initialize args = {}
    args.each do |key, value|
      self.instance_variable_set("@#{key}", value) unless value.nil?
    end
  end

  def trigger enemy
    @effect.trigger enemy if @effect
  end
end