module Audio::GUI
  
  class << self
    
    def run
      @window = Window.new
      
      @window.show
    end
    
    attr_reader :window
    
  end
  
end

require 'audio/gui/window'
