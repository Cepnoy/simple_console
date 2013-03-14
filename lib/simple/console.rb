require 'term/ansicolor'
require 'logger'
require 'stringio'

class Simple
  class Console
    VERSION = '0.0.1'

    include Term::ANSIColor

    attr_accessor :color_output
    
    def initialize args = {}
        @color_output = args[:color_output] || 'false'
    end

    def info(message, args={})

        str = StringIO.new
        logger = Logger.new(str)
        c = Term::ANSIColor

        if @color_output == true
            if args[:title].nil? || args[:title].empty?
                logger.info blue( on_white message  )
            else
                logger.info dark( bold( blue( on_white underscore(args[:title])  ) ) ) + blue( on_white  ' : ' +message   )
            end
        else
            if args[:title].nil? || args[:title].empty?
                logger.info(message)
            else
                logger.info "#{args[:title]} => #{message}"
            end
        end
        str.string.chomp
    end

    def error(message)

        str = StringIO.new
        logger = Logger.new(str)
        c = Term::ANSIColor

        if @color_output == true 
                logger.info dark( red( on_white message  ) )
        else
                logger.error message
        end    
        str.string.chomp
    end

  end
end

