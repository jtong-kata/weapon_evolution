class Person
  attr_accessor :name, :hp, :attack_point, :effect
  attr_reader :weapon

  include AttributeInitializer

  def initialize args = {}
    init_by args
    @weapon = NoWeapon.new
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
    source_desc = "#{enemy.job}#{enemy.name}"
    target_desc = "#{job}#{@name}"

    attack_string = enemy.weapon.build_attack_string source_desc, target_desc

    attack_string << build_harm_string(enemy) << "#{@name}剩余生命：#{@hp}"
  end

  def build_harm_string(enemy)
    harm_point = harm_point(enemy)
    enemy.weapon.build_harm_string(enemy, self, harm_point)
  end




end