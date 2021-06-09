# JOIN을 활용한 쿼리
```
select A.emp_id, A.emp_name, A.dept_code, A.dept_name , A.parent_dept , B.dept_name, B.boss_id, B.emp_name from 

( select t.emp_id, t.emp_name, t.dept_code, td.dept_name, parent_dept from temp t join tdept td on t.dept_code = td.dept_code where parent_dept='CA0001') A 

join 

( select parent_dept, dept_name , boss_id, emp_name from tdept join temp on temp.dept_code = tdept.dept_code 
where parent_dept = 'CA0001' and tdept.dept_code='CA0001') B 

on A.parent_dept = B.parent_dept ; 
```
- 옆으로 붙여주는 것은 JOIN으로 어지간하면 다 된다고 생각하자. 
