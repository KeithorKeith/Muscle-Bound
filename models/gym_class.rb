require_relative( '../db/sql_runner' )

class GymClass

    attr_reader :time, :capacity, :class_name, :id 

    def initialize( options )
        @id = options['id'].to_i if options['id']
        @time = options['time']
        @capacity = options['capacity'].to_i
        @class_name = options['class_name']
    end

    def save()
        sql = "INSERT INTO gymclasses
        (
          time,
          capacity,
          class_name
        )
        VALUES
        (
          $1, $2, $3
        )
        RETURNING id"
        values = [@time, @capacity, @class_name]
        results = SqlRunner.run(sql, values)
        @id = results.first()['id'].to_i
      end

      def self.delete_all
        sql = "DELETE FROM gymclasses"
        SqlRunner.run( sql )
      end

      def self.all
        sql = "SELECT * FROM gymclasses"
        results = SqlRunner.run( sql )
        return results.map { |hash| GymClass.new( hash )}
      end
end