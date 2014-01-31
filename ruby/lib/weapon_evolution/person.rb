class Person
  attr_accessor :name, :hp, :attack_point, :effect

  def initialize args = {}
    args.each do |key, value|
      self.instance_variable_set("@#{key}", value) unless value.nil?
    end
    @normal_effect = NoEffect.new
    to_normal
  end

  def job
    "普通人"
  end

  def attack enemy
    @effect.calculate self, enemy do
      enemy.be_attacked_by self
    end
  end

  def to_normal
    @effect = @normal_effect
  end

  def be_harmed harm
    @hp -= harm
  end

  def defence_point
    0
  end


  def be_attacked_by enemy
    build_formatted_attack_string(enemy)
  end

  def harm_point(enemy)
    enemy.attack_point - defence_point
  end

  protected
  def build_formatted_attack_string(enemy)

    attack_string = "#{enemy.job}#{enemy.name}" <<
        "#{"用"+ enemy.weapon.name if defined?(enemy.weapon) && !enemy.weapon.nil?}攻击了#{job}#{@name},"
    harm_string = build_harm_string(enemy)

    attack_string << harm_string <<
        "#{@name}剩余生命：#{@hp}"
  end

  def build_harm_string(enemy)
    harm_point = harm_point(enemy)
    if defined?(enemy.weapon) && !(enemy.weapon.nil?)
      enemy.weapon.build_harm_format_string(enemy, self, harm_point)
    else
      be_harmed harm_point
      "#{name}受到了#{harm_point}点伤害,"
    end

  end




end