require( 'minitest/autorun' )
require_relative( '../models/league.rb' )
require_relative( '../models/match.rb' )
require_relative( '../models/team.rb' )

class TestLeague < Minitest::Test

  def setup
    @team1 = Team.new( { 'name' => "Ricks team", 'id' => 1 } )
    @team2 = Team.new( { 'name' => "Vals team", 'id' => 2 } )
    @teams = [ @team1, @team2 ]
    @match1 = Match.new( { 
            'home_team_id' => @team1.id,
            'away_team_id' => @team2.id,
            'home_team_score' => 4,
            'away_team_score' => 2
    })
    @match2 = Match.new( { 
            'home_team_id' => @team1.id,
            'away_team_id' => @team2.id,
            'home_team_score' => 2,
            'away_team_score' => 4
     } )
    @match3 = Match.new( { 
            'home_team_id' => @team1.id,
            'away_team_id' => @team2.id,
            'home_team_score' => 1,
            'away_team_score' => 0
     } )
    @match4 = Match.new( { 
            'home_team_id' => @team1.id,
            'away_team_id' => @team2.id,
            'home_team_score' => 2,
            'away_team_score' => 1
     } )
    @match5 = Match.new( { 
            'home_team_id' => @team1.id,
            'away_team_id' => @team2.id,
            'home_team_score' => 2,
            'away_team_score' => 2
     } )
    @matches = [ @match1, @match2, @match3, @match4, @match5 ]
    options = {
      'teams' => @teams,
      'matches' => @matches
    }
    @league = League.new( options )
  end
  
  def test_list_teams
    result = @league.list_teams
    expectation = [ "Ricks team", "Vals team"]
    assert_equal( expectation, result )    
  end

  def test_number_of_wins
    result = @league.number_of_wins(@team1.id)
    assert_equal( 3, result )    
  end

  def test_number_of_loses
    result = @league.number_of_loses(@team1.id)
    assert_equal( 1, result )    
  end

  def test_number_of_draws
    result = @league.number_of_draws(@team1.id)
    assert_equal( 1, result )
  end

  def test_total_points
    result = @league.total_points( @team1.id)
    assert_equal( 10, result )
  end

  def test_total_goals_for
    result = @league.total_goals_for( @team1.id)
    assert_equal( 11, result )
  end

  def test_total_goals_against
    result = @league.total_goals_against( @team1.id)
    assert_equal( 9, result )
  end

  def test_goal_difference
    result = @league.goal_difference(@team1.id)
    assert_equal( 2, result )
  end

end