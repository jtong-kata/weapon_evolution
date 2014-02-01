class NoWeapon
  attr_reader :attack_point

  include AttackStringBuilder

  def initialize
    @effect = NoEffect.new
    @attack_point = 0
  end

  def build_attack_string source_desc, target_desc
      source_desc << "攻击了" << target_desc << ","
  end
end