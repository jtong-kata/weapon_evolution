class Game
  def fight_between player_a, player_b
    puts player_a.attack player_b
    if player_b.hp > 0
      return fight_between player_b, player_a
    end

    return puts "#{player_b.name}被打败了"
  end
end