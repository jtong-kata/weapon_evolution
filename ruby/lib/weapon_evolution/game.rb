class Game
  def fight_between player_a, player_b
    player_a.attack player_b
    if player_b.hp > 0
      fight_between player_b, player_a
    end

  end
end