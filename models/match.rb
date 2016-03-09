require( 'pg' )

class Match

  attr_reader( :id, :home_team_id, :away_team_id, :home_team_score, :away_team_score )

  def initialize( options )
    @id = options['id']
    @home_team_id = options['home_team_id']
    @away_team_id = options['away_team_id']
    @home_team_score = options['home_team_score']
    @away_team_score = options['away_team_score']
  end

  def self.all()
    sql = "SELECT * FROM matches"
    matches = SqlRunner.execute( sql )
    return matches.map { |match| Match.new( match ) }
  end

  def self.create( options )
    sql = "INSERT INTO matches ( home_team_id, away_team_id, home_team_score, away_team_score ) VALUES ( #{ options['home_team_id'] }, #{ options['away_team_id'] }, #{ options['home_team_score'] },#{ options['away_team_score'] } )"
    SqlRunner.execute( sql )
    return Match.new( Match.last_entry() )
  end

  def self.last_entry
    sql = "SELECT * FROM matches ORDER BY id DESC limit 1;"
    return SqlRunner.execute( sql ).first()
  end

  def self.delete_all 
    sql = "DELETE FROM matches"
    SqlRunner.execute( sql )
  end

  def did_win?( team_id )
    if (@home_team_id == team_id && @home_team_score > @away_team_score) || (@away_team_id == team_id && @away_team_score > @home_team_score)
      return true
    end
  end

  def did_lose?( team_id )
    if (@home_team_id == team_id && @home_team_score < @away_team_score) || (@away_team_id == team_id && @away_team_score < @home_team_score)
      return true
    end
  end

  def did_draw?( team_id )
    if (@home_team_id == team_id && @home_team_score == @away_team_score) || (@away_team_id == team_id && @away_team_score == @home_team_score)
      return true
    end
  end

  def goals_for( team_id )
    if @home_team_id == team_id
      return @home_team_score 
    elsif @away_team_id == team_id
      return @away_team_score
    end
  end

  def goals_against( team_id )
    if @home_team_id == team_id
      return @away_team_score 
    elsif @away_team_id == team_id
      return @home_team_score
    end
  end

end