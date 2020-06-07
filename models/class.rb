require_relative( '../db/sql_runner' )

class MuscleBoundClass

    attr_reader :time, :capacity, :class_name, :id 

    def initialize( options )
        @id = options['id'].to_i if options['id']
        @time = options['time']
        @capacity = options['capacity']
        @class_name = options['class_name']
    end

end