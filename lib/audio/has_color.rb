require 'gosu'

module Audio::HasColor
  
  def initialize(*arguments)
    @color = Gosu::Color.new( 255, 255, 255, 255 ) # Gosu's default is black, we want white for our default
    
    super(*arguments)
  end
  
  # Get the color of this object.
  # 
  # @return [Gosu::Color]
  attr_reader :color
  
  # Set the color of this object.
  # 
  # @param [Gosu::Color] value
  # @return [Gosu::Color]
  def color=(value)
    raise TypeError, 'color must be a Gosu::Color' unless value.is_a?(Gosu::Color)
    
    @color = value
  end
  
end
