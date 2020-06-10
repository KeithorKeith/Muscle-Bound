require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/member' )
require_relative( '../models/book_class' )
require_relative( '../models/gym_class' )
also_reload( '../models/*' ) 

get '/book_classes' do
    @bookclasses = BookClass.all()
    erb ( :"book_class_list/index" )
end

get '/book_classes/new' do
    @members = Member.all()
    @gymclasses = GymClass.all()
    erb( :"book_class_list/new" )
end

post '/book_classes' do
    bookclass = BookClass.new( params )
    bookclass.save()
    redirect to "/book_classes"
end

