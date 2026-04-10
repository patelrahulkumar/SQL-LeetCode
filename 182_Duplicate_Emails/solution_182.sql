# MySQL query statement below
Select email As Email
From Person 
Group By email 
Having Count(email)>1;