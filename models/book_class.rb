require_relative( '../db/sql_runner' )

class BookClass

    attr_reader :gym_class_id, :member_id, :id

    def initialize( options )
        @id = options['id'].to_i if options['id']
        @member_id = options['member_id'].to_i
        @gym_class_id = options['gym_class_id'].to_i
    end

    def save()
        sql = "INSERT INTO book_classes
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
        sql = "SELECT * FROM book_classes"
        results = SqlRunner.run( sql )
        return results.map { |book_class| BookClass.new( book_class ) }
      end

      def self.delete_all()
        sql = "DELETE FROM book_classes"
        SqlRunner.run( sql )
      end
    