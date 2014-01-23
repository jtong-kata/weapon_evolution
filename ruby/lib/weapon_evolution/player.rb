class Player
 attr_accessor :name, :hp, :attack_point

 def beat enemy
   enemy.hp -= self.attack_point
   if enemy.hp > 0
     return enemy.beat self
   else
     "#{enemy.name}被打败了"
   end
 end

end