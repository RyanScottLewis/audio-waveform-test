require 'audio/gui/widget/base'
require 'audio/clip'

class Audio::GUI::Widget::SpectrumViewer < Audio::GUI::Widget::Base
  
  def initialize(attributes={})
    super
    
    raise ArgumentError, 'clip attribute must be set' if @clip.nil?
  end
  
  # Get the audio clip for this waveform.
  attr_reader :clip
  
  def clip=(value)
    raise TypeError, 'clip must be an Audio::Clip' unless value.is_a?(Audio::Clip)
    
    @clip = value
    
    @clip
  end
  
  def draw
    draw_waveform
    draw_legend
  end
  
  protected
  
  def draw_waveform
    last_x = 0
    center_y = height / 2
    @clip.samples.each_with_index do |sample, sample_index|
      last_y = center_y
      current_x = ( (width.to_f / @clip.samples.length.to_f) * sample_index ).round

      sample.each_with_index do |value, index|
        current_y = ( center_y * -value) + center_y
        color = @colors[index]
        
        draw_line( last_x, last_y, color, current_x, current_y, color, index, :additive )
      end

      last_x = current_x
    end
  end
  
  def draw_legend
    @colors.each_with_index do |color, index|
      y_offset = 15 * index
      window.draw_quad(x + 10, y + 10 + y_offset, color, x + 20, y + 10 + y_offset, color, x + 20, y + 20 + y_offset, color, x + 10, y + 20 + y_offset, color)
    end
  end
  
end
