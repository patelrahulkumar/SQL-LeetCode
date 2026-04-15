# Duplicate Emails (LeetCode 182)

## Problem Statement

Given a table `Person` with the following schema:

### **Person**

| Column Name | Type    |
| ----------- | ------- |
| id          | int     |
| email       | varchar |

* `id` is the **primary key**
* Each row contains an email address
* Emails are **non-null**

---

## Objective

Find all **duplicate emails**, i.e., email addresses that appear **more than once**.

Return the result in any order.

---

## Approach

This problem focuses on identifying repeated values using SQL aggregation.

### Core Strategy:

* Use **GROUP BY** to cluster identical emails
* Use **COUNT()** to measure frequency
* Use **HAVING** to filter duplicates

---

## SQL Solutions

### Method 1: GROUP BY + HAVING (Recommended ⭐)

```sql id="g7h2ks"
SELECT email AS Email
FROM Person
GROUP BY email
HAVING COUNT(email) > 1;
```

---

### Method 2: Self Join (Alternative)

```sql id="n2kd9q"
SELECT DISTINCT p1.email AS Email
FROM Person p1
JOIN Person p2
ON p1.email = p2.email
AND p1.id <> p2.id;
```

---

## Explanation

### GROUP BY Approach:

1. `GROUP BY email` → Groups identical emails together
2. `COUNT(email)` → Counts occurrences of each email
3. `HAVING COUNT(email) > 1` → Filters only duplicates

### Self Join Approach:

* Joins the table with itself
* Matches rows with same email but different IDs
* `DISTINCT` ensures unique output

---

## Example

### Input

| id | email                     |
| -- | ------------------------- |
| 1  | [a@b.com](mailto:a@b.com) |
| 2  | [c@d.com](mailto:c@d.com) |
| 3  | [a@b.com](mailto:a@b.com) |

---

### Output

```id="r9sk2m"
a@b.com
```

---

## Concepts Covered

* SQL Aggregation
* GROUP BY
* HAVING clause
* Self Join
* Duplicate detection

---

## Key Takeaways

* Use **GROUP BY + HAVING** for clean and efficient duplicate detection
* `HAVING` is used with aggregated results (not `WHERE`)
* Self joins help understand relational comparisons

---

## Complexity Analysis

| Metric           | Value                      |
| ---------------- | -------------------------- |
| Time Complexity  | O(n)                       |
| Space Complexity | O(n) (depends on grouping) |

---

## Tags

* `SQL`
* `Aggregation`
* `GROUP BY`
* `HAVING`
* `Database`
* `Easy`

---