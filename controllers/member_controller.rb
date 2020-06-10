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

get '/members/new' do
    erb( :"member_list/new" )
end

get '/members/home' do
    erb( :"member_list/home" )
end

post '/members' do
    member = Member.new( params )
    member.save()
    redirect to "/members"
end

get '/members/:id' do
    @member = Member.find( params['id'] )
    erb( :"member_list/show" )
end