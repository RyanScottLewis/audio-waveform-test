require 'pp'
require 'gosu'
require 'wavefile'
require 'audio/gui/widget/waveform_viewer'

class Audio::GUI::Window < Gosu::Window
  
  def initialize
    super( 640, 480, false )
    
    @redraw = true
    clip = log("Loading") do
      Audio.assets.load( Audio.assets.all.first )
    end
    
    waveshaped_samples = shape_samples( clip.samples, 10.5 )
    
    waveshaped_clip = Audio::Clip.new( waveshaped_samples )
    
    
    
    WaveFile::Writer.new( Audio.root.join('assets', 'Drums DnB 170BPM 01_WAVESHAPED.wav'), WaveFile::Format.new(:stereo, :float_32, 44100) ) do |writer|
      buffer = WaveFile::Buffer.new( waveshaped_samples, writer.format )
      writer.write( buffer )
    end
    
    
    # puts ?! * 80
    # pp clip.samples.first(100)
    # # pp clip.spectrum
    # puts ?! * 80
    
    @waveform_viewer_top = Audio::GUI::Widget::WaveformViewer.new( width: width, height: height/2, clip: clip, window: self )
    @waveform_viewer_bottom = Audio::GUI::Widget::WaveformViewer.new( y: height/2, width: width, height: height/2, clip: waveshaped_clip, window: self )
  end
  
  def draw
    log("Drawing") do
      @waveform_viewer_top.draw
      @waveform_viewer_bottom.draw
    end
  end
  
  def needs_redraw?
    if @redraw
      @redraw = false
      
      true
    else
      false
    end
  end
  
  protected
  
  def log(message, &block)
    Audio.logger.info("#{message}...")
    start_time = Time.now
    
    result = block.call
    
    Audio.logger.info("#{message} done! [Took #{Time.now-start_time}s]")
    
    result
  end
  
  def shape_samples(samples, preamp=1)
    samples.collect do |sample|
      sample.collect do |value|
        value *= preamp
        
        if value > 1
          value - ( (value-1) * value**3 )
        else
          value
        end
      end
    end
  end
  
end
