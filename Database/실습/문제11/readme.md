#1

```
select e.employee_id, e.last_name, e.department_id, e.salary , d.avg_sal
from 
employee e 
join 
(select avg(salary) as avg_sal , department_id from employees group by department_id ) d 
on e.department_id = d.department_id 
where e.salary > d.avg_sal  ; 
```
