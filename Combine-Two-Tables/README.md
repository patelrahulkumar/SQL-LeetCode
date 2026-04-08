# Combine Two Tables

##  Problem Summary
Given two tables: **Person** and **Address**.

We need to retrieve:
- First Name  
- Last Name  
- City  
- State  

If a person does not have an address, return **NULL** for city and state.

---

##  Approach
- Used **LEFT JOIN** to include all records from the `Person` table  
- Joined both tables using `personId`  
- If no matching address exists, SQL automatically returns `NULL`

---

##  SQL Query
```sql
SELECT 
    p.firstName, 
    p.lastName, 
    a.city, 
    a.state
FROM Person p
LEFT JOIN Address a
ON p.personId = a.personId;