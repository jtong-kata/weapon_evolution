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


  def be_attacked_by enemy
    @hp -= enemy.attack_point
    if hp > 0
      "#{enemy.job}#{enemy.name}攻击了#{job}#{name},#{name}受到了#{enemy.attack_point}点伤害,#{name}剩余生命：#{@hp}"
    else
      "#{name}被打败了"
    end
  end

end