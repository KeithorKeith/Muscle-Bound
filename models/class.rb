require_relative( '../db/sql_runner' )

class class

    attr_reader( :time, :capacity, :id)

    def initialize( options )
        @id = options['id'].to_i if options['id']
        @time = options['time']
        @capacity = options['capacity']
    end