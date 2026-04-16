# MySQL query statement below
Delete s1
From Person s1
Join Person s2
On s1.email = s2.email
And s1.id > s2.id;