require_relative( '../db/sql_runner' )

class BookClass

    attr_reader :gym_class_id, :member_id, :id

    def initialize( options )
        @id = options['id'].to_i if options['id']
        @member_id = options['member_id'].to_i
        @gym_class_id = options['gym_class_id'].to_i
    end

    def member()
      sql = "SELECT * FROM members
      WHERE id = $1"
      values = [@member_id]
      results = SqlRunner.run( sql, values )
      return Member.new( results.first )
    end

    def gym_class()
      sql = "SELECT * FROM gymclasses
      WHERE id = $1"
      values = [@gym_class_id]
      results = SqlRunner.run( sql, values )
      return GymClass.new( results.first )
    end

    def save()
        sql = "INSERT INTO bookclasses
        (
          gym_class_id,
          member_id
        )
        VALUES
        (
          $1, $2
        )
        RETURNING id"
        values = [@gym_class_id, @member_id]
        results = SqlRunner.run(sql, values)
        @id = results.first()['id'].to_i
      end
    
      def self.all()
        sql = "SELECT * FROM bookclasses"
        results = SqlRunner.run( sql )
        return results.map { |book_class| BookClass.new( book_class ) }
      end

      def self.delete_all()
        sql = "DELETE FROM bookclasses"
        SqlRunner.run( sql )
      end
end