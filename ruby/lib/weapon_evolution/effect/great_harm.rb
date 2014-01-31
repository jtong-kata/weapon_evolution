class GreatHarm

  def initialize args = {}
    args.each do |key, value|
      self.instance_variable_set("@#{key}", value) unless value.nil?
    end
  end

  def calculate player, enemy, &block
    block.call
  end

  def trigger player
    "#{player.name}发动了致命一击"
  end

  def build_harm_string enemy, me, harm_point
    harm_point *= 3
    me.be_harmed harm_point
    "#{trigger enemy},#{me.name}受到了#{harm_point}点伤害,"
  end
end