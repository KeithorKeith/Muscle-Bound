require_relative( '../db/sql_runner' )

class Member

    attr_reader :first_name, :last_name, :id 

    def initialize( options )
        @id = options['id'].to_i if options['id']
        @first_name = options['first_name']
        @last_name = options['last_name']
    end

    def save()
        sql = "INSERT INTO members
        (
          first_name,
          last_name
        )
        VALUES
        (
          $1, $2
        )
        RETURNING id"
        values = [@first_name, @last_name]
        results = SqlRunner.run(sql, values)
        @id = results.first()['id'].to_i
    end

    def self.delete_all
        sql = "DELETE FROM members"
        SqlRunner.run( sql )
    end

    def gym_classes()
        sql = "SELECT g.* FROM gymclasses g INNER JOIN bookclasses b ON b.gym_class_id = g.id WHERE b.member_id = $1;"
        values = [@id]
        results = SqlRunner.run(sql, values)
        return results.map { |gymclass| GymClass.new(gymclass)}
    end

    def self.find( id )
        sql = "SELECT * FROM members
        WHERE id = $1"
        values = [id]
        results = SqlRunner.run( sql, values )
        return Member.new( results.first )
    end

    def self.all
        sql = "SELECT * FROM members"
        results = SqlRunner.run( sql )
        return results.map { |hash| Member.new( hash )}
    end

    def full_name()
        return "#{first_name} #{last_name}"
    end

end