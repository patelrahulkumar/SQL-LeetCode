# Rising Temperature

## Problem Statement

Given a table `Weather`:

| Column Name | Type |
| ----------- | ---- |
| id          | int  |
| recordDate  | date |
| temperature | int  |

* `id` is unique.
* Each `recordDate` is unique.
* The table stores daily temperature records.

### Objective

Find all **IDs** where the temperature is **higher than the previous day (yesterday)**.

---

## Key Insight

We need to compare:

* Current day's temperature
* Previous day's (exactly 1 day before) temperature

Important:

* Not based on `id`
* Based on **date difference = 1 day**

---

## Approach

### Method 1: Self Join

We join the table with itself:

* One represents the current day (`w1`)
* One represents the previous day (`w2`)

### Logic:

* Match rows where:

  ```
  w1.recordDate = w2.recordDate + 1 day
  ```
* Then filter:

  ```
  w1.temperature > w2.temperature
  ```

---

## SQL Solution

```sql
SELECT w1.id
FROM Weather w1
JOIN Weather w2
ON w1.recordDate = DATE_ADD(w2.recordDate, INTERVAL 1 DAY)
WHERE w1.temperature > w2.temperature;
```

---

## Alternative Approach (Window Function)

```sql
SELECT id
FROM (
    SELECT id,
           temperature,
           recordDate,
           LAG(temperature) OVER (ORDER BY recordDate) AS prev_temp,
           LAG(recordDate) OVER (ORDER BY recordDate) AS prev_date
    FROM Weather
) t
WHERE temperature > prev_temp
AND DATEDIFF(recordDate, prev_date) = 1;
```

---

## Example

### Input:

| id | recordDate | temperature |
| -- | ---------- | ----------- |
| 1  | 2015-01-01 | 10          |
| 2  | 2015-01-02 | 25          |
| 3  | 2015-01-03 | 20          |
| 4  | 2015-01-04 | 30          |

### Output:

| id |
| -- |
| 2  |
| 4  |

---

## Concepts Used

* Self Join
* Date Functions (`DATE_ADD`, `DATEDIFF`)
* Comparison Filtering
* Window Functions (`LAG`)

---

## Edge Cases

* Missing dates → ignore (must be exactly 1-day difference)
* Single row → no output
* Decreasing or equal temperatures → ignore

---

## Conclusion

This problem is a classic example of:

> **Comparing consecutive records using SQL**

Mastering this helps in:

* Time-series analysis
* Trend detection
* Real-world analytics problems

---

## Tags

`SQL` `Self Join` `Window Function` `Date Handling` `Easy`

---