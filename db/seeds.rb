require_relative( '../models/match' )
require_relative( '../models/team' )
require( 'pry-byebug' )

Match.delete_all
Team.delete_all

@team1 = Team.create( { 'name' => "Alison and Adams Team" } )
@team2 = Team.create( { 'name' => "Learning to Code Team" } )


@match1 = Match.create( { 
        'home_team_id' => @team1.id,
        'away_team_id' => @team2.id,
        'home_team_score' => 4,
        'away_team_score' => 2
})
@match2 = Match.create( { 
        'home_team_id' => @team1.id,
        'away_team_id' => @team2.id,
        'home_team_score' => 2,
        'away_team_score' => 4
 } )
@match3 = Match.create( { 
        'home_team_id' => @team1.id,
        'away_team_id' => @team2.id,
        'home_team_score' => 1,
        'away_team_score' => 0
 } )
@match4 = Match.create( { 
        'home_team_id' => @team1.id,
        'away_team_id' => @team2.id,
        'home_team_score' => 2,
        'away_team_score' => 1
 } )
@match5 = Match.create( { 
        'home_team_id' => @team1.id,
        'away_team_id' => @team2.id,
        'home_team_score' => 2,
        'away_team_score' => 2
 } )

binding.pry
nil
