class Weapon
  attr_accessor :name, :attack_point, :effect

  def initialize args = {}
    args.each do |key, value|
      self.instance_variable_set("@#{key}", value) unless value.nil?
    end
    @effect = NoEffect.new
  end


  def build_harm_format_string(enemy, me, harm_point)
    @effect.build_harm_string enemy, me, harm_point
  end
end