class NoEffect

  def calculate player, enemy, &block
    block.call
  end

  def trigger enemy, me
    nil
  end
end
