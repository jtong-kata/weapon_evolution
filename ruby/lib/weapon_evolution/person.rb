class Person
  attr_accessor :name, :hp, :attack_point

  def initialize args = {}
    args.each do |key, value|
      self.instance_variable_set("@#{key}", value) unless value.nil?
    end
  end

  def job
    "普通人"
  end

  def attack enemy
    enemy.be_attacked_by self
  end

  def defence_point
    0
  end


  def be_attacked_by enemy
    harm_point = harm_point(enemy)
    @hp -= harm_point
    result = build_formatted_attack_string(enemy, harm_point)
    if hp <= 0
      result << "\n#{name}被打败了"
    end
    result
  end

  def harm_point(enemy)
    enemy.attack_point - defence_point
  end

  protected
  def build_formatted_attack_string(enemy, harm_point)
    "#{enemy.job}#{enemy.name}" <<
        "#{"用"+ enemy.weapon.name if defined?(enemy.weapon) && !enemy.weapon.nil?}" <<
        "攻击了#{job}#{name},#{name}受到了#{harm_point}点伤害,#{name}剩余生命：#{@hp}"
  end

end