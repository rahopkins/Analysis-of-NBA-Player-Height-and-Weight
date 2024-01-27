-- First, creating a temp table to join the stathead tables and remove accent characters from player names
WITH stats as (
  SELECT 
    TRANSLATE(adv.player, "çáéíóúàèìòùäëïöüÿâêîôûåøØÅÁÀÂÄÈÉÊËÍÎÏÌÒÓÔÖÚÙÛÜŸÇñŞşãčćģūŠšýžŽıņİāğČ", "caeiouaeiouaeiouyaeiouaoOAAAAAEEEEIIIIOOOOUUUUYCnSsaccguSsyzZinIagC") as player_name,
    adv.position as position,
    adv.season as season,
    adv.bpm as bpm,
    adv.def_rating as def_rating,
    pg.ppg as ppg
  FROM `nimble-willow-406320.NBA_height_weight.stathead-advanced` adv 
  JOIN `nimble-willow-406320.NBA_height_weight.stathead-pergame` pg
    on pg.player = adv.player and pg.season = adv.season
)

-- Next, joining the 'stats' table with the player data from kaggle and converting player height and weight to desired units/format
SELECT 
  stats.player_name as player,
  stats.position as position,
  stats.season as season,
  stats.bpm as bpm,
  stats.def_rating as def_rating,
  stats.ppg as ppg,
  players.player_height as player_height_cm,
  ROUND(players.player_height/2.54, 0) as player_height_inches,
  CAST(FLOOR(players.player_height /30.48) AS INT) AS feet,
  MOD(ROUND(CAST(players.player_height/2.54 as NUMERIC), 0), 12) as inches,
  CAST(CONCAT(CAST(FLOOR(players.player_height /30.48) AS INT), '-',MOD(ROUND(CAST(players.player_height/2.54 as NUMERIC), 0), 12)) AS STRING) as player_height_ft_in,
  players.player_weight as player_weight_kg,
  CAST(ROUND(players.player_weight*2.204623, 0) as INT) as player_weight_lbs
FROM stats
JOIN `nimble-willow-406320.NBA_height_weight.kaggle-playerstats` players 
  on players.player_name = stats.player_name and players.season = stats.season
ORDER BY stats.bpm desc
