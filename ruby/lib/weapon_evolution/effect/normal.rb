class NoEffect

  def calculate player, enemy, &block
    block.call
  end

  def trigger player
    nil
  end

  def build_harm_string enemy, me, harm_point
    me.be_harmed harm_point
    "#{me.name}受到了#{harm_point}点伤害,"
  end
end
