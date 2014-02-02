class Normal < Effect

  def calculate player, enemy, &block
    block.call
  end

  def trigger player
    ""
  end
end
