module  AttributeInitializer
  def init_by args ={}
    args.each do |key, value|
      self.instance_variable_set("@#{key}", value) unless value.nil?
    end
  end
end
