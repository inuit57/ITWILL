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

#2
```
sekect employee_id, last_name, department_id, salary 
from employees
where employee_id not in (select manager_id from employees where manger_id is not null) ; 
```

#3
```
select department_id , department_name 
from departemnts
where department_id 
not in 
(select department_id 
from employees
where department_id is not null) ; 
```
