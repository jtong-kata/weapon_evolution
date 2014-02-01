class Weapon
  attr_accessor :name, :attack_point, :effect
  include AttackStringBuilder, AttributeInitializer


  def initialize args = {}
    @effect = NoEffect.new
    init_by args
  end


  def build_attack_string source_desc, target_desc
    source_desc <<
        "#{"用"+ name }攻击了#{target_desc},"
  end
end
