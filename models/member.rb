require_relative( '../db/sql_runner' )

class Member

    attr_reader :first_name, :last_name, :id 

    def initialize( options )
        @id = options['id'].to_i if options['id']
        @first_name = options['first_name']
        @last_name = options['last_name']
    end

end