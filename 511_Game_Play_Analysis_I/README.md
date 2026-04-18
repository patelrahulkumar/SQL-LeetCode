# Game Play Analysis I

## Problem Statement

Given a table `Activity` with the following schema:

### **Activity**

| Column Name  | Type |
| ------------ | ---- |
| player_id    | int  |
| device_id    | int  |
| event_date   | date |
| games_played | int  |

* `(player_id, event_date)` is the **primary key**
* Each row represents a player's login activity
* A player may log in multiple times on different dates

---

## Objective

Find the **first login date** for each player.

---

## Intuition

This is a **group-wise minimum problem** where we need to:

1. Group records by `player_id`
2. Identify the **earliest (`MIN`) event_date**
3. Return that as the first login

In short:

> For each player → find their earliest activity date

---

## SQL Solution

---

### Method 1: GROUP BY + MIN (Optimal)

```sql
SELECT 
    player_id,
    MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id;
```

#### Explanation:

* `GROUP BY player_id` → creates groups for each player
* `MIN(event_date)` → finds earliest login date
* Returns one row per player

---

### Method 2: Window Function (Alternative)

```sql
SELECT player_id, event_date AS first_login
FROM (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY player_id ORDER BY event_date) AS rn
    FROM Activity
) t
WHERE rn = 1;
```

#### Explanation:

* `PARTITION BY player_id` → groups players
* `ORDER BY event_date` → sorts login dates
* `ROW_NUMBER()` → assigns rank
* Keep only the first login (`rn = 1`)

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

## Concepts Covered

* Aggregation in SQL
* `GROUP BY`
* Aggregate Function: `MIN()`
* Window Functions (`ROW_NUMBER`)
* Partitioning Data

---

## Key Insights

* Use **MIN()** to find earliest values
* `GROUP BY` simplifies per-entity calculations
* Window functions help when more row-level data is needed

---

## Complexity Analysis

| Metric           | Value |
| ---------------- | ----- |
| Time Complexity  | O(n)  |
| Space Complexity | O(1)  |

---

## Tags

* `SQL`
* `Aggregation`
* `GROUP BY`
* `Window Functions`
* `Easy`

---

## Use Cases

* First login tracking
* User onboarding analytics
* Retention analysis

---