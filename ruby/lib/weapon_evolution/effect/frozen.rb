class Frozen < Effect
  attr_accessor :effect_round_left, :round_before_trigger


  def round_before_trigger= round
    @round_before_trigger = round
    @round_before_trigger_left = round
  end

  def calculate player, enemy, &block
    if effect_round_left <= 0
      player.to_normal
    end

    if @round_before_trigger_left <= 0
      @round_before_trigger_left = round_before_trigger
      @effect_round_left -= 1
      "#{player.name}冻得直哆嗦，没有击中#{enemy.name}"
    else
      @round_before_trigger_left -= 1
      block.call
    end
  end

  def trigger enemy
    "#{enemy.name}冻僵了"
  end
end