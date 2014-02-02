class Solider < Person
  attr_accessor :defence_point, :weapon, :armor

  def job
    "战士"
  end

  def initialize args = {}
    @weapon = NoWeapon.new
    init_by args
    @normal_effect = Normal.new
    to_normal
  end

  def attack_point
    @attack_point +
        (weapon.nil? ? 0 : weapon.attack_point)
  end

  def defence_point
    @defence_point +
        (armor.nil? ? 0 : armor.defence_point)
  end
end