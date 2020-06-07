require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )

require_relative( 'models/class' )
require_relative( 'models/member' )
also_reload( './models/*' )

get '/class' do 
    erb( :class_list )
end

get '/member' do
    erb( :member_list )
end

get '/class/:id' do
    @class_name = MuscleBoundClass.new(params['id'])
    erb(:show)
end