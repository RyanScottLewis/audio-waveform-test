require 'pathname'
require 'wavefile'
require 'audio/clip'

class Audio::AssetManager
  
  # @param [#to_s] path The path to the assets folder
  def initialize(path)
    @path = Pathname.new( path.to_s )
  end
  
  # Get the path of the assets directory.
  # 
  # @return [Pathname]
  attr_reader :path
  
  # List all wave filenames in the assets directory.
  # 
  # @return [Array<String>]
  def all
    Pathname.glob( @path.join('*.{wav,wave}') ).collect(&:basename).collect(&:to_s)
  end
  
  # Read a wave file and resample to 32-bit floating point, if needed.
  # 
  # @param [#to_s] name The name of the asset, including the file extension.
  # @return [Clip] An audio clip containing the samples.
  def load(name)
    buffer = nil
    
    reader = WaveFile::Reader.new( @path.join( name.to_s ) ) do |reader|
      buffer = reader.read( reader.total_sample_frames )
    end
    
    unless reader.format.sample_format == :float_32
      format = WaveFile::Format.new( reader.format.channels, :float_32, reader.format.sample_rate )
      
      buffer.convert!( format )
    end
    
    Audio::Clip.new( buffer.samples )
  end
  
end
