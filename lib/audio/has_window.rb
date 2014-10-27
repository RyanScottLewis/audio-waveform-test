module Audio::HasWindow
  
  # Get the window for this object.
  attr_reader :window
  
  # Set the window for this object.
  def window=(value)
    raise TypeError, 'window must be a Gosu::Window' unless value.is_a?(Gosu::Window)
    
    @window = value
  end
  
end
