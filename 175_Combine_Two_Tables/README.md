# 175. Combine Two Tables

## Problem Statement

Given two tables `Person` and `Address`, combine them to report each person's first name, last name, city, and state.

If a person does not have an address, return `NULL` for city and state.

---

## Table Schema

### Person

| Column Name | Type    |
| ----------- | ------- |
| personId    | int     |
| lastName    | varchar |
| firstName   | varchar |

### Address

| Column Name | Type    |
| ----------- | ------- |
| addressId   | int     |
| personId    | int     |
| city        | varchar |
| state       | varchar |

---

## Objective

Return:

* `firstName`
* `lastName`
* `city`
* `state`

Include all persons, even if they do not have an address.

---

## Approach

We use a **LEFT JOIN**:

* Keep all rows from `Person`
* Match rows from `Address` using `personId`
* Missing matches → `NULL`

---

## SQL Solution

```sql id="x7v4lm"
SELECT 
    p.firstName,
    p.lastName,
    a.city,
    a.state
FROM Person p
LEFT JOIN Address a
ON p.personId = a.personId;
```

---

## Example

### Input

#### Person

| personId | lastName | firstName |
| -------- | -------- | --------- |
| 1        | Wang     | Allen     |
| 2        | Alice    | Bob       |

#### Address

| addressId | personId | city          | state      |
| --------- | -------- | ------------- | ---------- |
| 1         | 2        | New York City | New York   |
| 2         | 3        | Leetcode      | California |

---

### Output

| firstName | lastName | city          | state    |
| --------- | -------- | ------------- | -------- |
| Allen     | Wang     | NULL          | NULL     |
| Bob       | Alice    | New York City | New York |

---

## Complexity Analysis

* **Time Complexity:** O(n) (single join)
* **Space Complexity:** O(1)

---

## Key Insight

Use **LEFT JOIN** when:

* You must keep all records from one table
* And optionally match records from another table

---

## Tags

* SQL
* Joins
* Left Join
* LeetCode Easy
