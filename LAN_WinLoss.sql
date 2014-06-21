select 
  cast(concat
  (
    substr(GAME_ID,4,4),
    '-',substr(GAME_ID,8,2),
    '-',substr(GAME_ID,10,2)
  ) as date) as 'GAME_DATE' -- extract yyyy-mm-dd date from game_id
, substr(GAME_ID,4,4) as 'SEASON' -- extract year from game_id
, case
    when
      AWAY_TEAM_ID = "LAN"
      and
      AWAY_SCORE_CT > HOME_SCORE_CT
    then  AWAY_SCORE_CT - HOME_SCORE_CT -- lan away winning score
    when
      AWAY_TEAM_ID = "LAN"
      and
      AWAY_SCORE_CT < HOME_SCORE_CT
    then  AWAY_SCORE_CT - HOME_SCORE_CT -- lan away losing score
    when
      HOME_TEAM_ID = "LAN"
      and
      HOME_SCORE_CT > AWAY_SCORE_CT
      then HOME_SCORE_CT - AWAY_SCORE_CT -- lan home winning score
    when
      HOME_TEAM_ID = "LAN"
      and
      HOME_SCORE_CT < AWAY_SCORE_CT
    then HOME_SCORE_CT - AWAY_SCORE_CT -- lan home losing score
  end as "LAN_SCORE"
, AWAY_TEAM_ID
, AWAY_SCORE_CT
, HOME_TEAM_ID
, HOME_SCORE_CT 
-- into outfile '../tmp/results.csv'
-- fields terminated by ','
-- optionally enclosed by '"'
-- lines terminated by '\n'
from GAMES 
where 
  AWAY_TEAM_ID = "LAN" 
or 
  HOME_TEAM_ID = "LAN"
order by 
-- extract and order by yyyy-mm-dd date from game_id
  cast(concat
  (
    substr(GAME_ID,4,4),
    '-',substr(GAME_ID,8,2),
    '-',substr(GAME_ID,10,2)
  ) as date)
;
