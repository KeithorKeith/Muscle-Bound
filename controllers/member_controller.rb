require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )

require_relative( '../models/gym_class' )
require_relative( '../models/member' )
also_reload( './models/*' )

get '/members' do
    @members = Member.all()
    erb ( :"member_list/index" )
end

