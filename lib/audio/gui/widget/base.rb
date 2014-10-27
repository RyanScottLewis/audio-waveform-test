require 'audio/has_attributes'
require 'audio/has_window'
require 'audio/has_coordinates'
require 'audio/has_dimensions'
require 'audio/has_color'
require 'audio/gui/widget'

class Audio::GUI::Widget::Base
  
  include Audio::HasAttributes
  include Audio::HasWindow
  include Audio::HasCoordinates
  include Audio::HasDimensions
  include Audio::HasColor
  
  def draw
    
  end
  
  protected
  
  # Draw a line.
  # 
  # @param [#to_hash, #to_h] options
  # @option options [#to_hash, #to_h] :begin The options for the beginning point.
  # @option options[:begin] [#to_i] :x The x coordinate.
  # @option options[:begin] [#to_i] :y The y coordinate.
  # @option options[:begin] [Gosu::Color] :color The color.
  # @option options [#to_hash, #to_h] :end The options for the ending point.
  # @option options[:end] [#to_i] :x The x coordinate.
  # @option options[:end] [#to_i] :y The y coordinate.
  # @option options[:end] [Gosu::Color] :color The color.
  # @option options [#to_i] :z The Z-index for the line.
  # @option options [#to_sym] :mode The mode for drawing the line. Must be :default or :additive.
  # def draw_line(options={})
  #   options = validate_draw_line_options(options)
  #
  #   # Offset option coordinates by this widget's coordinates.
  #   options[:begin][:x] += x
  #   options[:begin][:y] += y
  #   options[:end][:y] += x
  #   options[:end][:y] += y
  #
  #   # Set default color of line points to this widget's color.
  #   options[:begin][:color] ||= color
  #   options[:end][:color] ||= color
  #
  #   window.draw_line(
  #     options[:begin][:x],
  #     options[:begin][:y],
  #     options[:begin][:color],
  #     options[:end][:x],
  #     options[:end][:y],
  #     options[:end][:color],
  #     options[:z],
  #     options[:mode]
  #   )
  # end
  
  
  # The above took 5 seconds longer! WTF
  def draw_line(x1, y1, c1, x2, y2, c2, z=0, mode=:default)
    x1 += x
    y1 += y
    x2 += x
    y2 += y
    c1 ||= color
    c2 ||= color
    
    window.draw_line( x1, y1, c1, x2, y2, c2, z, mode )
  end
  
  # def validate_draw_line_options(options)
  #   raise TypeError, 'options must respond to #to_hash or #to_h' unless options.respond_to?(:to_hash) || options.respond_to?(:to_h)
  #   options = options.to_hash rescue options.to_h
  #
  #   options = { z: 0, mode: :default }.merge( options )
  #
  #   raise TypeError, 'options[:begin] must respond to #to_hash or #to_h' unless options[:begin].respond_to?(:to_hash) || options[:begin].respond_to?(:to_h)
  #   options[:begin] = options[:begin].to_hash rescue options[:begin].to_h
  #
  #   raise TypeError, 'options[:begin][:x] must respond to #to_i' unless options[:begin][:x].respond_to?(:to_i)
  #   options[:begin][:x] = options[:begin][:x].to_i
  #
  #   raise TypeError, 'options[:begin][:y] must respond to #to_i' unless options[:begin][:y].respond_to?(:to_i)
  #   options[:begin][:y] = options[:begin][:y].to_i
  #
  #   raise TypeError, 'options[:begin][:color] must be nil or a Gosu::Color' unless options[:begin][:color].nil? || options[:begin][:color].is_a?(Gosu::Color)
  #
  #   raise TypeError, 'options[:end] must respond to #to_hash or #to_h' unless options[:end].respond_to?(:to_hash) || options[:end].respond_to?(:to_h)
  #   options[:end] = options[:end].to_hash rescue options[:end].to_h
  #
  #   raise TypeError, 'options[:end][:x] must respond to #to_i' unless options[:end][:x].respond_to?(:to_i)
  #   options[:end][:x] = options[:end][:x].to_i
  #
  #   raise TypeError, 'options[:end][:y] must respond to #to_i' unless options[:end][:y].respond_to?(:to_i)
  #   options[:end][:y] = options[:end][:y].to_i
  #
  #   raise TypeError, 'options[:end][:color] must be nil or a Gosu::Color' unless options[:end][:color].nil? || options[:end][:color].is_a?(Gosu::Color)
  #
  #   raise TypeError, 'options[:z] must respond to #to_i' unless options[:z].respond_to?(:to_i)
  #   options[:z] = options[:z].to_i
  #
  #   raise TypeError, 'options[:mode] must respond to #to_i' unless options[:mode].respond_to?(:to_sym)
  #   options[:mode] = options[:mode].to_sym
  #   raise ArgumentError, 'options[:mode] must be :default or :additive' unless [:default, :additive].include?( options[:mode] )
  #
  #   options
  # end
  
end
