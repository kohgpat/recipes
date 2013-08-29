class Step
  attr_accessor :number, :description

  def initialize(attrs = {})
    @number = attrs[:number]
    @description = attrs[:description]
  end
end
