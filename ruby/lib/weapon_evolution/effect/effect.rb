class Effect
  include AttributeInitializer

  def initialize args = {}
    init_by args
  end

  def build_harm_string enemy, me, harm_point
    me.be_harmed harm_point
    be_hurt_string(me.name, harm_point) << "#{trigger me}"
  end

  protected
  def be_hurt_string(my_name, harm_point)
    "#{my_name}受到了#{harm_point}点伤害,"
  end
end