require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )

require_relative( 'models/class' )
require_relative( 'models/member' )
also_reload( './models/*' )

get '/class' do
    erb( :index )
end