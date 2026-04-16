# Delete Duplicate Emails (LeetCode 196)

## Problem Statement

Given a table `Person` with the following schema:

### **Person**

| Column Name | Type    |
| ----------- | ------- |
| id          | int     |
| email       | varchar |

* `id` is the **primary key**
* Each row contains an email address
* Emails are **non-null** and may contain duplicates

---

## Objective

Delete all duplicate email records such that:

* Each email appears **only once**
* The row with the **smallest `id` is retained**
* All other duplicate rows are removed

---

## Intuition

This is a **deduplication problem** where we must:

1. Identify duplicate emails
2. Preserve the **minimum `id` per email**
3. Remove all other entries

In short:

> Keep the *first occurrence*, delete the rest.

---

## SQL Solutions

---

### Method 1: Self Join

```sql
DELETE p1
FROM Person p1
JOIN Person p2
ON p1.email = p2.email
AND p1.id > p2.id;
```

#### Explanation:

* Compare rows within the same table (**self join**)
* For the same email:

  * Keep the row with smaller `id`
  * Delete rows where `id` is larger

---

### Method 2: GROUP BY + MIN (Alternative)

```sql
DELETE FROM Person
WHERE id NOT IN (
    SELECT MIN(id)
    FROM Person
    GROUP BY email
);
```

#### Explanation:

* `GROUP BY email` → groups duplicates
* `MIN(id)` → selects the row to keep
* Delete all rows not in this set

---

## Example

### Input

| id | email                                       |
| -- | ------------------------------------------- |
| 1  | [john@example.com](mailto:john@example.com) |
| 2  | [bob@example.com](mailto:bob@example.com)   |
| 3  | [john@example.com](mailto:john@example.com) |

---

### Output

| id | email                                       |
| -- | ------------------------------------------- |
| 1  | [john@example.com](mailto:john@example.com) |
| 2  | [bob@example.com](mailto:bob@example.com)   |

---

## Concepts Covered

* Self Join
* GROUP BY
* Aggregate Functions (`MIN`)
* DELETE with Conditions
* Subqueries

---

## Key Insights

* Use **self join** for row-level comparison
* Use **GROUP BY + MIN** for aggregation-based filtering
* Always define **which duplicate to keep** (here: smallest `id`)

---

## Complexity Analysis

| Metric           | Value                        |
| ---------------- | ---------------------------- |
| Time Complexity  | O(n log n) (due to grouping) |
| Space Complexity | O(n)                         |

---

## Tags

* `SQL`
* `Database`
* `Deduplication`
* `JOIN`
* `GROUP BY`
* `Easy`

---