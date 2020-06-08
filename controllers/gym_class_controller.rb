require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )

require_relative( '../models/gym_class' )
require_relative( '../models/member' )
also_reload( './models/*' )

get '/gym_classes' do
    @gymclasses = GymClass.all()
    erb ( :"gym_class_list/index" )
end


get '/gym_classes/new' do
    erb( :"gym_class_list/new" )
end
