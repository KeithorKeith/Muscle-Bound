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

      def update()
        sql = "UPDATE gymclasses
        SET
        (
          time,
          capacity,
          class_name
        ) =
        (
          $1, $2, $3
        )
        WHERE id = $4"
        values = [@time, @capacity, @class_name, @id]
        SqlRunner.run( sql, values )
      end

      def self.delete_all
        sql = "DELETE FROM gymclasses"
        SqlRunner.run( sql )
      end

      def members()
        sql = "SELECT m.* FROM members m INNER JOIN bookclasses b ON b.member_id = m.id WHERE b.gym_class_id = $1;"
        values = [@id]
        results = SqlRunner.run(sql, values)
        return results.map { |member| Member.new(member)}
      end

      def self.find( id )
        sql = "SELECT * FROM gymclasses
        WHERE id = $1"
        values = [id]
        results = SqlRunner.run( sql, values )
        return GymClass.new( results.first )
    end

      def self.all
        sql = "SELECT * FROM gymclasses"
        results = SqlRunner.run( sql )
        return results.map { |hash| GymClass.new( hash )}
      end
end