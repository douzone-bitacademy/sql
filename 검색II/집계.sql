-- 예제1 : 현재, 각 사원별로 평균연봉 출력

  select emp_no, avg(salary) as avg_salary
    from salaries
   where to_date = '9999-01-01' 
group by emp_no
order by avg_salary desc;

-- 예제 3:  사원별 몇 번의 직책 변경이 있었는지 조회
  select emp_no, count(*)
    from titles
group by emp_no
order by count(*) desc; 

-- 예제4 : 각 사원별로 평균연봉 출력하되 50,000불 이상인 직원만 출력
  select emp_no, avg(salary)
    from salaries
group by emp_no
  having avg(salary) > 50000; 


-- 예제5: 현재 직책별로 인원수를 구하되, 직책별로 인원이 
--       100명 이상인 직책만 출력하세요.
  select title, count(*) 
    from titles
   where to_date = '9999-01-01'
group by title
  having count(*) > 100
order by count(*) asc;

-- 예제6-1: 현재 직책이 Engineer인 직원들에 대해서만 평균급여를 구하세요.
select avg(salary)
  from titles a,
	   salaries b
 where a.emp_no = b.emp_no
   and a.to_date = '9999-01-01'
   and b.to_date = '9999-01-01'
   and a.title = 'Engineer';


-- 예제6-2: 현재 부서별로 현재 직책이 Engineer인 직원들에 대해서만 평균급여를 구하세요.
  select c.dept_no, d.dept_name, avg(salary)
    from titles a,
	     salaries b,
         dept_emp c,
         departments d
   where a.emp_no = b.emp_no
     and b.emp_no = c.emp_no
     and c.dept_no = d.dept_no
     and a.to_date = '9999-01-01'
     and b.to_date = '9999-01-01'
     and c.to_date = '9999-01-01'
     and a.title = 'Engineer'
group by c.dept_no;   


-- 예제7: 현재 직책별로 급여의 총합을 구하되 Engineer직책은 제외하세요
--       단, 총합이 2,000,000,000이상인 직책만 나타내며 급여총합에
--       대해서 내림차순(DESC)로 정렬하세요.   

  select a.title, sum(b.salary)
    from titles a, salaries b
   where a.emp_no = b.emp_no          -- join 조건
     and a.to_date = '9999-01-01'     -- row 선택 조건1
     and b.to_date = '9999-01-01'     -- row 선택 조건2
	 and a.title != 'Engineer'        -- row 선택 조건3
group by a.title
  having sum(b.salary) >= 2000000000
order by sum(b.salary);  
  
 