require_relative( '../models/league' )
require_relative( '../models/match' )
require_relative( '../models/team' )

# get '/league/new' do
#   erb(:"league/new")
# end

get '/league' do
  options = {'teams' => Team.all, 'matches' => Match.all}
  @league = League.new( options )
  erb(:"league/index")
end


