require 'pathname'
require 'logger'

module Audio
  class << self
    
    def root
      @root ||= Pathname.new(__FILE__).join( '..', '..' ).expand_path
    end
    
    def logger
      @logger ||= Logger.new( STDOUT )
    end
    
    def assets
      @assets ||= AssetManager.new( root.join('assets') )
    end
    
  end
end

require 'audio/asset_manager'
require 'audio/gui'
require 'audio/filter'
