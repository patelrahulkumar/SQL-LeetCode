# MySQL query statement below
Select e.name As Employee
From Employee e
Join Employee m
On e.managerId=m.id
Where e.salary>m.salary;