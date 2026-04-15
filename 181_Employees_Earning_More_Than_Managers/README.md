# 181. Employees Earning More Than Their Managers

## Problem Statement

Given an `Employee` table containing employee details, find all employees who earn more than their respective managers.

### Table Schema

| Column Name | Type    |
| ----------- | ------- |
| id          | int     |
| name        | varchar |
| salary      | int     |
| managerId   | int     |

* `id` is the primary key.
* `managerId` refers to the `id` of another employee (manager).

---

## Objective

Return the names of employees whose salary is strictly greater than their manager's salary.

---

## Approach

We use a **self join** on the Employee table:

* Treat one instance as the employee (`e`)
* Treat another as the manager (`m`)
* Join on `e.managerId = m.id`
* Compare salaries

---

## SQL Solution

```sql
SELECT e.name AS Employee
FROM Employee e
JOIN Employee m
ON e.managerId = m.id
WHERE e.salary > m.salary;
```

---

## Example

### Input

| id | name  | salary | managerId |
| -- | ----- | ------ | --------- |
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | NULL      |
| 4  | Max   | 90000  | NULL      |

### Output

| Employee |
| -------- |
| Joe      |

---

## Complexity Analysis

* **Time Complexity:** O(n) (single join scan)
* **Space Complexity:** O(1)

---

## Key Insight

This is a classic **self-join problem**, where a table is joined with itself to compare hierarchical relationships.

---

## Tags

* SQL
* Joins
* Self Join
* LeetCode Easy
