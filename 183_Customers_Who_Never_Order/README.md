# 🧾 Customers Who Never Order (LeetCode 183)

## 📌 Problem Statement

Given two tables:

### **Customers**

| Column | Type    |
| ------ | ------- |
| id     | int     |
| name   | varchar |

* `id` is the primary key.

### **Orders**

| Column     | Type |
| ---------- | ---- |
| id         | int  |
| customerId | int  |

* `customerId` is a foreign key referencing `Customers.id`.

---

## 🎯 Objective

Find all customers who **never placed any orders**.

Return the result in any order.

---

## 🧠 Approach

The problem is essentially about identifying records in one table that **do not exist** in another table.

### ✅ Key Idea:

Use a **LEFT JOIN** and filter out rows where no matching record exists in the `Orders` table.

---

## 💡 SQL Solution

### 🔹 Method 1: LEFT JOIN (Recommended)

```sql
SELECT c.name AS Customers
FROM Customers c
LEFT JOIN Orders o
ON c.id = o.customerId
WHERE o.customerId IS NULL;
```

---

### 🔹 Method 2: NOT EXISTS (Efficient & Safe)

```sql
SELECT name AS Customers
FROM Customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM Orders o
    WHERE c.id = o.customerId
);
```

---

### 🔹 Method 3: NOT IN

```sql
SELECT name AS Customers
FROM Customers
WHERE id NOT IN (
    SELECT customerId FROM Orders
);
```

⚠️ *Note:* `NOT IN` can fail if the subquery contains `NULL`.

---

## 📊 Example

### Input:

**Customers**

| id | name  |
| -- | ----- |
| 1  | Joe   |
| 2  | Henry |
| 3  | Sam   |
| 4  | Max   |

**Orders**

| id | customerId |
| -- | ---------- |
| 1  | 3          |
| 2  | 1          |

---

### Output:

```
Henry
Max
```

---

## 📚 Concepts Covered

* SQL Joins (LEFT JOIN)
* NULL Handling (`IS NULL`)
* Subqueries
* Anti Join Pattern
* NOT EXISTS vs NOT IN

---

## 🚀 Key Takeaways

* Use **LEFT JOIN + IS NULL** to find unmatched records.
* Prefer **NOT EXISTS** for better reliability.
* Understand how NULL values affect queries.

---

## 🏁 Complexity

* Time Complexity: `O(N + M)`
* Space Complexity: `O(1)` (excluding result set)

---

## 🔥 Interview Tip

This is a classic **Anti-Join** problem.
You should immediately think of:

* `LEFT JOIN + IS NULL`
* `NOT EXISTS`

---

## 📎 Tags

`SQL` `Joins` `Subqueries` `Database` `Easy`

---