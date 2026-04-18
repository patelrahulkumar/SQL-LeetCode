# Game Play Analysis I

## Problem Overview

You are given a table `Activity` that records the login activity of players in a game.

Each record contains:

* `player_id` → Unique ID of the player
* `device_id` → Device used for login
* `event_date` → Date of login
* `games_played` → Number of games played that day

A player may have multiple records across different dates.

---

## Objective

Find the **first login date** for each player.

---

## Approach

To solve this problem:

1. Group records by `player_id`
2. For each player, find the **minimum `event_date`**
3. Return the result as `first_login`

---

## SQL Solution

```sql
SELECT 
    player_id,
    MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id;
```

---

## Example

### Input

| player_id | device_id | event_date | games_played |
| --------- | --------- | ---------- | ------------ |
| 1         | 2         | 2016-03-01 | 5            |
| 1         | 2         | 2016-05-02 | 6            |
| 2         | 3         | 2017-06-25 | 1            |
| 3         | 1         | 2016-03-02 | 0            |
| 3         | 4         | 2018-07-03 | 5            |

---

### Output

| player_id | first_login |
| --------- | ----------- |
| 1         | 2016-03-01  |
| 2         | 2017-06-25  |
| 3         | 2016-03-02  |

---

## Concepts Used

* SQL Aggregation
* `GROUP BY`
* Aggregate Function: `MIN()`

---

## Key Takeaway

This is a classic example of:

> Finding **earliest record per group** using `GROUP BY` and `MIN()`

---

## Alternative Approach (Window Function)

```sql
SELECT player_id, event_date AS first_login
FROM (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY player_id ORDER BY event_date) AS rn
    FROM Activity
) t
WHERE rn = 1;
```

---

## Use Cases

* First login tracking
* Customer onboarding analysis
* User behavior analytics

---

## Tags

* `SQL`
* `Aggregation`
* `Group By`
* `LeetCode Easy`

---