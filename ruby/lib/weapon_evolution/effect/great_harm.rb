class GreatHarm

  def initialize args = {}
    args.each do |key, value|
      self.instance_variable_set("@#{key}", value) unless value.nil?
    end
  end

  def calculate player, enemy, &block
    block.call
  end

  def trigger enemy, me
    "#{me.name}发动了致命一击"
  end
end