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