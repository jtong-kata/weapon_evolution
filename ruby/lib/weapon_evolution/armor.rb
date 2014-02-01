class Armor
  attr_accessor :name, :defence_point
  include AttributeInitializer

  def initialize args = {}
    init_by args
  end
end