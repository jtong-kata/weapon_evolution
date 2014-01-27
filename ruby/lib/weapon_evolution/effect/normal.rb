class NoEffect

  def is_on
    true
  end

  def calculate player, &block
    block.call
  end

end
