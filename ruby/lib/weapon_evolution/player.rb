class Player
 attr_accessor :name, :hp, :attack_point

 def initialize args = {}
   args.each do |key, value|
     self.instance_variable_set("@#{key}", value) unless value.nil?
   end
 end


 def beat enemy
   enemy.be_beaten self
 end

 def beat_old enemy
   enemy.hp -= self.attack_point
   if enemy.hp > 0
     enemy.beat self
   else
     "#{enemy.name}被打败了"
   end
 end

 protected
 def be_beaten enemy
   @hp -= enemy.attack_point
   if hp >0
     beat enemy
   else
     "#{name}被打败了"
   end
 end

end