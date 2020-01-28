-- FROM절의 서브쿼리
select now() as a, sysdate() as b, 3 + 1 as c;
select a, b, c
  from (select now() as a, sysdate() as b, 3 + 1 as c) a;

-- WHERE절의 서브쿼리: 단일행
-- 단일행 연산자: =, >, <, <=, <=, <>   

-- 예제:
-- 현재 Fai Bale이 근무하는 부서에서 근무하는 직원의 사번, 전체 이름을 출력해보세요.
select b.dept_no
  from employees a, dept_emp b
 where a.emp_no = b.emp_no
   and b.to_date = '9999-01-01'
   and concat(a.first_name, ' ', a.last_name) = 'Fai Bale';
   
select a.emp_no, concat(a.first_name, ' ', a.last_name)
  from employees a, dept_emp b
 where a.emp_no = b.emp_no
   and b.to_date = '9999-01-01'
   and b.dept_no = 'd004';


select a.emp_no, concat(a.first_name, ' ', a.last_name)
  from employees a, dept_emp b
 where a.emp_no = b.emp_no
   and b.to_date = '9999-01-01'
   and b.dept_no = (select b.dept_no
                      from employees a, dept_emp b
                     where a.emp_no = b.emp_no
                       and b.to_date = '9999-01-01'
                       and concat(a.first_name, ' ', a.last_name) = 'Fai Bale');
                       
-- 실습문제 1: 현재 전체사원의 평균 연봉보다 
-- 적은 급여를 받는 사원의 이름, 급여를 나타내세요.

select avg(salary)
  from salaries
 where to_date = '9999-01-01';

  select a.first_name, b.salary
    from employees a,
	     salaries b
   where a.emp_no = b.emp_no
     and b.to_date = '9999-01-01'
     and b.salary < (select avg(salary)
                       from salaries
                      where to_date = '9999-01-01')
order by b.salary desc; 

-- 실습문제 2: 현재, 가장 적은 평균급여 를 받고 있는 직책의 평균급여를 구하세요   
-- 예) Egineer 45000

-- 1) 직책별 평균급여 중 가장 적은 평균급여 방법1
select min(avg_salary) 
  from (  select a.title, round(avg(b.salary)) as avg_salary
          from titles a, salaries b
         where a.emp_no = b.emp_no
           and a.to_date = '9999-01-01'
           and b.to_date = '9999-01-01'
	  group by a.title) a; 

-- 2) 직책별 평균급여 중 가장 적은 평균급여 방법2
--    TOP-K: order by 한 후에 top부터 k개를 빼내는 것
  select round(avg(b.salary)) as avg_salary
	from titles a, salaries b
   where a.emp_no = b.emp_no
	 and a.to_date = '9999-01-01'
	 and b.to_date = '9999-01-01'
group by a.title
order by avg_salary asc
   limit 1;

-- sol1      
select a.title, avg(b.salary) as avg_salary
          from titles a, salaries b
         where a.emp_no = b.emp_no
           and a.to_date = '9999-01-01'
           and b.to_date = '9999-01-01'
	  group by a.title
        having round(avg_salary) = (select min(avg_salary) 
  from (  select a.title, round(avg(b.salary)) as avg_salary
          from titles a, salaries b
         where a.emp_no = b.emp_no
           and a.to_date = '9999-01-01'
           and b.to_date = '9999-01-01'
	  group by a.title) a);
   
-- sol2
select a.title, avg(b.salary) as avg_salary
          from titles a, salaries b
         where a.emp_no = b.emp_no
           and a.to_date = '9999-01-01'
           and b.to_date = '9999-01-01'
	  group by a.title
        having round(avg_salary) = (  select round(avg(b.salary)) as avg_salary
	from titles a, salaries b
   where a.emp_no = b.emp_no
	 and a.to_date = '9999-01-01'
	 and b.to_date = '9999-01-01'
group by a.title
order by avg_salary asc
   limit 1);
   
-- sol3) join으로만 해결: 서브쿼리를 사용할 필요가 없음
  select a.title, round(avg(b.salary)) as avg_salary
	from titles a, salaries b
   where a.emp_no = b.emp_no
	 and a.to_date = '9999-01-01'
	 and b.to_date = '9999-01-01'
group by a.title
order by avg_salary asc
   limit 1;   
   
   
-- WHERE절의 서브쿼리: 복수행
-- 복수행 연산자: in, not in, any, all

-- any 사용법
-- 1. =any : in과 완전 동일
-- 2. >any, >=any : 최소값 비교
-- 3. <any, <=any : 최대값 비교
-- 4. <>any : not in 과 동일

-- all 사용법
-- 1. =all
-- 2. >all, >=all: 최대값 비교
-- 3. <all, <=all: 최소값 비교

-- 예제: 현재 급여가 50000 이상인 직원 이름 출력
-- sol1
select a.first_name, b.salary
  from employees a,
       salaries b
 where a.emp_no = b.emp_no
   and b.to_date = '9999-01-01'
   and b.salary > 50000;

-- sol2
select a.first_name, b.salary
  from employees a,
       salaries b
 where a.emp_no = b.emp_no
   and b.to_date = '9999-01-01'
   and (a.emp_no, b.salary) in (select emp_no, salary
                                  from salaries
                                 where to_date = '9999-01-01'
                                   and salary > 50000);
-- sol4
select a.first_name, b.salary
  from employees a,
       salaries b
 where a.emp_no = b.emp_no
   and b.to_date = '9999-01-01'
   and (a.emp_no, b.salary) =any (select emp_no, salary
                                  from salaries
                                 where to_date = '9999-01-01'
                                   and salary > 50000);
 
-- sol3
select a.first_name, b.salary
  from employees a,
       (select emp_no, salary
		  from salaries
		 where to_date = '9999-01-01'
		   and salary > 50000) b
 where a.emp_no = b.emp_no;
 
 
-- 예제: 각 부서별로 최고 월급을 받는 직원의 이름과 월급을 출력
-- 둘리 400000

-- sol1: where절에 subquery =any
  select a.dept_no, max(salary)
    from dept_emp a, salaries b
   where a.emp_no = b.emp_no
     and a.to_date = '9999-01-01'
     and b.to_date = '9999-01-01'
group by a.dept_no;   
   
select c.dept_no, a.first_name, b.salary
  from employees a, salaries b, dept_emp c
 where a.emp_no = b.emp_no
   and b.emp_no = c.emp_no
   and b.to_date = '9999-01-01'
   and c.to_date = '9999-01-01'
   and (c.dept_no, b.salary) =any (  select a.dept_no, max(salary)
    from dept_emp a, salaries b
   where a.emp_no = b.emp_no
     and a.to_date = '9999-01-01'
     and b.to_date = '9999-01-01'
group by a.dept_no);
   
-- sol2: from절에 subquery
select c.dept_no, a.first_name, b.salary
  from employees a,
	   salaries b,
       dept_emp c,
       (select a.dept_no, max(salary) as max_salary
          from dept_emp a, salaries b
         where a.emp_no = b.emp_no
           and a.to_date = '9999-01-01'
           and b.to_date = '9999-01-01'
	  group by a.dept_no) d       
 where a.emp_no = b.emp_no
   and b.emp_no = c.emp_no
   and c.dept_no = d.dept_no
   and b.salary = d.max_salary
   and b.to_date = '9999-01-01'
   and c.to_date = '9999-01-01'; 