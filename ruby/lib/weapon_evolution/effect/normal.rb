class NoEffect

  def calculate player, enemy, &block
    block.call
  end

end
