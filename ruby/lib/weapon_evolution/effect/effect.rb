class Effect
  attr_accessor :probability

  include AttributeInitializer

  def initialize args = {}
    @probability = 0
    args.each do |key, value|
      unless value.nil?
        self.instance_variable_set("@#{key}", value) unless value.nil?
      end
    end
  end

  def build_harm_string enemy, me, harm_point
    triggered = lambda do
      me.status = self
      default(harm_point, me) << trigger(me)
    end

    trigger_randomly triggered, not_triggered(harm_point, me)
  end


  protected
  def trigger_randomly triggered, not_triggered
    if Random.rand() < @probability
      return triggered.call
    end
    return not_triggered.call
  end

  def be_hurt_string(my_name, harm_point)
    "#{my_name}受到了#{harm_point}点伤害,"
  end

  def not_triggered harm_point, me
    lambda do
      default(harm_point, me)
    end
  end

  def default(harm_point, me)
    me.be_harmed harm_point
    be_hurt_string(me.name, harm_point)
  end
end