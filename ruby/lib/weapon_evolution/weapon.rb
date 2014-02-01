class Weapon
  attr_accessor :name, :attack_point, :effect
  include AttackStringBuilder

  def initialize args = {}
    @effect = NoEffect.new
    args.each do |key, value|
      self.instance_variable_set("@#{key}", value) unless value.nil?
    end
  end


  def build_attack_string source_desc, target_desc
    source_desc <<
        "#{"用"+ name }攻击了#{target_desc},"
  end
end
