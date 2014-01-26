class Solider < Person
  attr_accessor :defence_point, :weapon

  def job
    "战士"
  end

  def attack_point
    @attack_point + weapon.attack_point
  end
end