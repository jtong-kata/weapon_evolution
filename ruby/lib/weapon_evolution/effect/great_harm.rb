class GreatHarm < Effect


  def trigger player
    "#{player.name}发动了致命一击"
  end

  def build_harm_string enemy, me, harm_point
    harm_point *= 3
    me.be_harmed harm_point
    "#{trigger enemy},#{me.name}受到了#{harm_point}点伤害,"
  end
end