module KeepingEffect
  def build_harm_string enemy, me, harm_point
    me.be_harmed harm_point
    "#{me.name}受到了#{harm_point}点伤害,#{trigger me},"
  end
end