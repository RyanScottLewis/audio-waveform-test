module Audio::HasAttributes
  
  def initialize(attributes={})
    update_attributes(attributes)
  end
  
  # Update the attributes on this object.
  # 
  # @param [#to_hash, #to_h] attributes
  # @return [Object] This object.
  def update_attributes(attributes={})
    raise TypeError, 'attributes must respond to #to_hash or #to_h' unless attributes.respond_to?(:to_hash) || attributes.respond_to?(:to_h)
    attributes = attributes.to_hash rescue attributes.to_h
    
    attributes.each { |attribute, value| send("#{attribute}=", value) }
    
    self
  end
  
end
