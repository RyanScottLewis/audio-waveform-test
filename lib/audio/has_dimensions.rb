module Audio::HasDimensions
  
  def initialize(*arguments)
    @width, @height = 0, 0
    
    super(*arguments)
  end
  
  # Get the width dimension of this object.
  attr_reader :width
  
  # Set the width dimension of this object.
  def width=(value)
    raise TypeError, 'width must respond to #to_i' unless value.respond_to?(:to_i)
    
    @width = value.to_i
  end
  
  # Get the height dimension of this object.
  attr_reader :height
  
  # Set the height dimension of this object.
  def height=(value)
    raise TypeError, 'height must respond to #to_i' unless value.respond_to?(:to_i)
    
    @height = value.to_i
  end
  
end
