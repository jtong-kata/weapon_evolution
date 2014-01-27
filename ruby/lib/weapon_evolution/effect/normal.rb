class NoEffect

  def calculate player, &block
    block.call
  end

end
