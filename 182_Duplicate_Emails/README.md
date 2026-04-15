# 182. Duplicate Emails

## Problem Statement

Given a table `Person` with the following schema:

| Column Name | Type    |
| ----------- | ------- |
| id          | int     |
| email       | varchar |

* `id` is the primary key.
* Each row contains an email address.
* Emails are guaranteed to be non-null.

### Task

Write a SQL query to find all **duplicate emails** (emails that appear more than once).

---

## Approach

To solve this problem, we use:

* **GROUP BY** → to group identical emails
* **COUNT()** → to count occurrences of each email
* **HAVING** → to filter groups with count greater than 1

---

## SQL Solution

```sql
SELECT email AS Email
FROM Person
GROUP BY email
HAVING COUNT(email) > 1;
```

---

## Explanation

1. `GROUP BY email` groups all identical emails together.
2. `COUNT(email)` calculates how many times each email appears.
3. `HAVING COUNT(email) > 1` filters only those emails that occur more than once.

---

## Example

### Input

| id | email                     |
| -- | ------------------------- |
| 1  | [a@b.com](mailto:a@b.com) |
| 2  | [c@d.com](mailto:c@d.com) |
| 3  | [a@b.com](mailto:a@b.com) |

### Output

| Email                     |
| ------------------------- |
| [a@b.com](mailto:a@b.com) |

---

## Alternative Solution (Self Join)

```sql
SELECT DISTINCT p1.email AS Email
FROM Person p1
JOIN Person p2
ON p1.email = p2.email AND p1.id <> p2.id;
```

---

## Key Concepts

* SQL Aggregation
* GROUP BY
* HAVING clause
* Duplicate detection

---

## Complexity

* Time Complexity: O(n)
* Space Complexity: O(n) (depends on grouping)

---

## Notes

* Preferred approach is **GROUP BY + HAVING** for clarity and performance.
* Self join is less efficient but useful for conceptual understanding.

---

## Conclusion

This is a fundamental SQL problem that tests your understanding of grouping and filtering aggregated data. It is commonly asked in interviews.

---
