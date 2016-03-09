require( 'minitest/autorun' )
require_relative( '../models/match' )
require_relative( '../models/team' )

class TestMatch < Minitest::Test

  def setup
    # @team1 = Team.new( { 'name' => "Ricks team", 'id' => 1 } )
    # @team2 = Team.new( { 'name' => "Vals team", 'id' => 2 } )
    # @teams = [ @team1, @team2 ]
    @match = Match.new( { 
            'home_team_id' => 8,
            'away_team_id' => 9,
            'home_team_score' => 4,
            'away_team_score' => 2
     } )
    @matches = [ @match ]
  end
  

  def test_match_won?
    result = @match.did_win?(8)
    assert_equal( true, result)
    result = @match.did_win?( 9)
    assert_equal( nil, result)
  end

  def test_goals_for
    result = @match.goals_for( 8 )
    assert_equal( 4, result )
  end
    
  def test_goals_against
    result = @match.goals_against( 8 )
    assert_equal( 2, result)
  end

end