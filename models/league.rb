class League

  attr_reader :teams, :matches

  def initialize( options )
    @teams = options[ 'teams' ]
    @matches = options[ 'matches' ]
  end

  def list_teams
    return @teams.map { | team | team.name }
    
  end

#### keep test iscolated and small

#### think about what type of data you want back: arrays - hash - etc
#### whos responsibility to know who has won, lost or drawn a match?
#### no sinatra !!


  def number_of_wins( team_id )
    winning_matches = @matches.select {|match| match.did_win?( team_id )}
    return winning_matches.length
  end

  def number_of_loses( team_id )
    losing_matches = @matches.select {|match| match.did_lose?( team_id )}
    return  losing_matches.length
  end

  def number_of_draws( team_id )
    drawn_matches = @matches.select {|match| match.did_draw?( team_id )}
    return  drawn_matches.length
  end

  def total_points( team_id )
    ( number_of_wins(team_id) * 3 ) + number_of_draws(team_id)
  end

  def total_goals_for( team_id )
    counter = 0
    @matches.select {|match| counter += match.goals_for( team_id ).to_i}
    return counter
  end

  def total_goals_against( team_id )
    counter = 0
    @matches.each {|match| counter += match.goals_against( team_id ).to_i}
    return counter
  end

  def goal_difference( team_id )
    return total_goals_for(team_id) - total_goals_against(team_id)
  end

end