class GreatHarm < Effect


  def trigger player
    "#{player.name}发动了致命一击,"
  end

  def build_harm_string enemy, me, harm_point
    trigger_handler = lambda do
      harm_point *= 3
      me.be_harmed harm_point
      "#{trigger enemy}" << be_hurt_string(me.name, harm_point)
    end

    trigger_randomly trigger_handler, not_triggered(harm_point, me)

  end
end
