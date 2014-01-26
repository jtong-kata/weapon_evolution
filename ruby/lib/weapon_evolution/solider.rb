class Solider < Person
  attr_accessor :defence_point, :weapon, :armor

  def job
    "战士"
  end

  def attack_point
    @attack_point + weapon.attack_point
  end

  def defence_point
    @defence_point + armor.defence_point
  end
end