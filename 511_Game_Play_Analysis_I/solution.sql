# MySQL query statement below
Select player_id, min(event_date) As first_login
From Activity
group by player_id;