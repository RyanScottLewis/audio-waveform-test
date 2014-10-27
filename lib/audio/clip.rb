require 'fftw3'

class Audio::Clip
  
  def initialize(samples)
    @samples = samples.is_a?(Array) ? samples : samples.to_a
    @samples.collect! do |sample|
      sample = sample.to_a unless sample.is_a?(Array)
      sample.collect!(&:to_f) unless sample.all? { |value| value.is_a?(Float) }
      
      sample
    end
    
    @channels = @samples.first.length
    
    calculate_fft
  end
  
  attr_reader :samples
  
  attr_reader :spectrum
  
  attr_reader :channels
  
  protected
  
  def calculate_fft(duration=1, max_points=3000)
    na = NArray[@samples]
    fc = FFTW3.fft(na)

    @spectrum = fc.real.to_a.flatten.first(na.length / 2).first(max_points).each_with_index.map do |val, index|
      [index / duration, val.abs]
    end
  end
  
end
